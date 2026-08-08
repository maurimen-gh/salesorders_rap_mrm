@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Orders - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

define root view entity ZORDERS_C_5902
  provider contract transactional_query
  as projection on ZORDERS_R_5902
{
  key OrderUUID,

      @Search.defaultSearchElement: true
      OrderID,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Items : redirected to composition child ZITEMS_C_5902
}
