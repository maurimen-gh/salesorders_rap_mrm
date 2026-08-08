@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

define view entity ZITEMS_C_5902
  as projection on ZITEMS_R_5902
{
  key ItemUUID,
      OrderUUID,
      
      @Search.defaultSearchElement: true
      ItemID,
      Name,
      Description,
      Releasedate,
      Discontinueddate,
      Price,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      Height,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      Width,
      Depth,
      Quantity,
      Unitofmeasure,
      LocalLastChangedAt,
      /* Associations */
      _Orders : redirected to parent ZORDERS_C_5902
}
