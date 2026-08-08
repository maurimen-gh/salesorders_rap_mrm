@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Orders - Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZORDERS_I_5902
  provider contract transactional_interface
  as projection on ZORDERS_R_5902
{
  key OrderUUID,
      OrderID,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl,
      //LocalCreatedBy,
      //LocalCreatedAt,
      //LocalLastChangedBy,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Items : redirected to composition child ZITEMS_I_5902
}
