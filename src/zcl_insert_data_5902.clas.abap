CLASS zcl_insert_data_5902 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_5902 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zitems_5902.
    DELETE FROM zorders_5902.

* return.

    DATA lt_customer TYPE STANDARD TABLE OF /dmo/customer.

    SELECT *
      FROM /dmo/customer
      INTO TABLE @lt_customer
      UP TO 3 ROWS.

    IF lines( lt_customer ) < 3.
      out->write( 'Less than 3 customers found in /DMO/CUSTOMER.' ).
      RETURN.
    ENDIF.

    DATA: lv_uuid1 TYPE sysuuid_x16,
          lv_uuid2 TYPE sysuuid_x16,
          lv_uuid3 TYPE sysuuid_x16.

    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_uuid1 ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_uuid2 ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_uuid3 ).

    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid1) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid2) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid3) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid4) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid5) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid6) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid7) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid8) ).
    cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = DATA(lv_item_uuid9) ).

    DATA lt_orders TYPE TABLE OF zorders_5902.
    DATA lt_items TYPE TABLE OF zitems_5902.

    lt_orders = VALUE #(
      ( client = sy-mandt order_uuid = lv_uuid1 order_id = '1000' email = lt_customer[ 1 ]-email_address firstname = lt_customer[ 1 ]-first_name lastname = lt_customer[ 1 ]-last_name country = lt_customer[ 1 ]-country_code
        createon = sy-datum deliverydate = sy-datum orderstatus = 1 )
      ( client = sy-mandt order_uuid = lv_uuid2 order_id = '1001' email = lt_customer[ 2 ]-email_address firstname = lt_customer[ 2 ]-first_name lastname = lt_customer[ 2 ]-last_name country = lt_customer[ 2 ]-country_code
        createon = sy-datum deliverydate = sy-datum orderstatus = 2 )
      ( client = sy-mandt order_uuid = lv_uuid3 order_id = '1002' email = lt_customer[ 3 ]-email_address firstname = lt_customer[ 3 ]-first_name lastname = lt_customer[ 3 ]-last_name country = lt_customer[ 3 ]-country_code
        createon = sy-datum deliverydate = sy-datum orderstatus = 2 )
    ).

    INSERT zorders_5902 FROM TABLE @lt_orders.

    lt_items = VALUE #(
      ( client = sy-mandt item_uuid = lv_item_uuid1 parent_uuid = lv_uuid1 item_id = '000010' name = 'LAPTOP'   description = 'LAPTOP'   releasedate = '20260101' discontinueddate = '20260502' price = '100.00'
        height = 10 width = 16 depth = '200.00' quantity = 2 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid2 parent_uuid = lv_uuid1 item_id = '000020' name = 'MOUSE'    description = 'MOUSE'    releasedate = '20260101' discontinueddate = '20260502' price = '30.00'
        height = 20 width = 16 depth = '150.00' quantity = 5 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid3 parent_uuid = lv_uuid1 item_id = '000030' name = 'KEYBOARD' description = 'KEYBOARD' releasedate = '20260101' discontinueddate = '20260502' price = '50.00'
        height = 22 width = 16 depth = '200.00' quantity = 4 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid4 parent_uuid = lv_uuid2 item_id = '000010' name = 'MONITOR'  description = 'MONITOR'  releasedate = '20260101' discontinueddate = '20260502' price = '250.00'
        height = 19 width = 16 depth = '500.00' quantity = 2 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid5 parent_uuid = lv_uuid2 item_id = '000020' name = 'HEADSET'  description = 'HEADSET'  releasedate = '20260101' discontinueddate = '20260502' price = '50.00'
        height = 15 width = 16 depth = '200.00' quantity = 4 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid6 parent_uuid = lv_uuid2 item_id = '000030' name = 'WEBCAM'   description = 'WEBCAM'   releasedate = '20260101' discontinueddate = '20260502' price = '100.00'
        height = 10 width = 16 depth = '200.00' quantity = 2 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid7 parent_uuid = lv_uuid3 item_id = '000010' name = 'PRINTER'  description = 'PRINTER'  releasedate = '20260101' discontinueddate = '20260502' price = '300.00'
        height = 11 width = 16 depth = '300.00' quantity = 1 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid8 parent_uuid = lv_uuid3 item_id = '000020' name = 'SCANNER'  description = 'SCANNER'  releasedate = '20260101' discontinueddate = '20260502' price = '150.00'
        height = 12 width = 16 depth = '150.00' quantity = 1 unitofmeasure = 'EA' )
      ( client = sy-mandt item_uuid = lv_item_uuid9 parent_uuid = lv_uuid3 item_id = '000030' name = 'UPS'      description = 'UPS'      releasedate = '20260101' discontinueddate = '20260502' price = '200.00'
        height = 15 width = 16 depth = '200.00' quantity = 1 unitofmeasure = 'EA' )
    ).

    INSERT zitems_5902 FROM TABLE @lt_items.

    IF sy-subrc = 0.
      COMMIT WORK.
      out->write( 'Data inserted OK.' ).
    ELSE.
      ROLLBACK WORK.
      out->write( 'Data inserted failed.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
