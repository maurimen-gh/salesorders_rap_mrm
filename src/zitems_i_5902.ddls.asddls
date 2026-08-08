@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEMS_I_5902
  as projection on ZITEMS_R_5902
{
  key ItemUUID,
      OrderUUID,
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
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Orders : redirected to parent ZORDERS_I_5902
}
