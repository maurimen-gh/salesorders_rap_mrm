CLASS lhc_Orders DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Orders RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Orders RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Orders RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Orders~Resume.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Orders~validateDates.

    METHODS setTravelNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Orders~setTravelNumber.

    METHODS validateMail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Orders~validateEmail.

ENDCLASS.

CLASS lhc_Orders IMPLEMENTATION.

  METHOD get_instance_features.
    "EML
    "    READ ENTITIES OF zorders_r_5902 IN LOCAL MODE
    "    ENTITY Orders
    "    FIELDS ( Orderstatus )
    "    WITH CORRESPONDING #( keys )
    "    RESULT DATA(orders).
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

  METHOD setTravelNumber.
    "EML
    READ ENTITIES OF zorders_r_5902 IN LOCAL MODE
    ENTITY Orders
    FIELDS ( OrderID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(orders).

    DELETE orders WHERE OrderID IS NOT INITIAL.

    CHECK orders IS NOT INITIAL.

    SELECT SINGLE FROM zorders_5902
    FIELDS MAX( order_id )
    INTO @DATA(max_orderid).

    "EML
    MODIFY ENTITIES OF zorders_r_5902 IN LOCAL MODE
    ENTITY Orders
    UPDATE
    FIELDS ( OrderID )
    WITH VALUE #( FOR ord IN orders INDEX INTO i ( %tky = ord-%tky
                                                   OrderID = max_orderid + 1 ) ).

  ENDMETHOD.

  METHOD validateMail.
    DATA Email TYPE SORTED TABLE OF zorders_r_5902 WITH UNIQUE KEY OrderUUID.

    READ ENTITIES OF zorders_r_5902 IN LOCAL MODE
         ENTITY Orders
         FIELDS ( Email ) WITH CORRESPONDING #( keys )
         RESULT DATA(orders).

    Email = CORRESPONDING #( orders DISCARDING DUPLICATES MAPPING  OrderUUID = OrderUUID Email = Email EXCEPT * ).

    LOOP AT orders ASSIGNING FIELD-SYMBOL(<fs_order>).

      IF line_exists( Email[ OrderUUID = <fs_order>-OrderUUID ] ).

        IF <fs_order>-Email IS INITIAL.

          APPEND VALUE #( %tky = <fs_order>-%tky ) TO failed-orders. " FAILED es para que SAP identifique el error, unicamente se le pasa la llave "
          APPEND VALUE #( %tky           = <fs_order>-%tky
                          %state_area    = 'VALIDATE_EMAIL'
                          %element-Email = if_abap_behv=>mk-on
                          %msg = new_message_with_text( text = 'Invalid EMAIL'
                                                        severity = if_abap_behv_message=>severity-error ) ) TO reported-orders. " REPORTED es para que el USUARIO vea el error, tiene distintos parametros.
          "%msg           =  NEW zcm_sale_order_5902( textid   = zcm_sale_order_5902=>invalid_email
          "                                         severity = if_abap_behv_message=>severity-error ) ) TO reported-orders. " REPORTED es para que el USUARIO vea el error, tiene distintos parametros.

        ELSE.

          RETURN.

        ENDIF.

      ELSE.

        APPEND VALUE #( %tky = <fs_order>-%tky ) TO failed-orders. " FAILED es para que SAP identifique el error, unicamente se le pasa la llave "
        APPEND VALUE #( %tky           = <fs_order>-%tky
                        %state_area    = 'VALIDATE_EMAIL'
                        %element-Email = if_abap_behv=>mk-on
                        %msg = new_message_with_text( text = 'Invalid MAIL'
                                                        severity = if_abap_behv_message=>severity-error ) ) TO reported-orders. " REPORTED es para que el USUARIO vea el error, tiene distintos parametros.
        "%msg           = NEW zcm_sale_order_5902( textid   = zcm_sale_order_5902=>invalid_email
        "                                         severity = if_abap_behv_message=>severity-error ) ) TO reported-orders. " REPORTED es para que el USUARIO vea el error, tiene distintos parametros.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
