CLASS lhc_Items DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setItemsNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Items~setItemsNumber.

    METHODS validateUnitofmeasure FOR VALIDATE ON SAVE
      IMPORTING keys FOR Items~validateUnitofmeasure.

ENDCLASS.

CLASS lhc_Items IMPLEMENTATION.

  METHOD setItemsNumber.
  ENDMETHOD.

  METHOD validateUnitofmeasure.
  ENDMETHOD.

ENDCLASS.
