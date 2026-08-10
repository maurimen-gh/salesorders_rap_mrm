@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Orders - Root entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZORDERS_R_5902
  as select from zorders_5902

  composition [0..*] of ZITEMS_R_5902 as _Items
{
  key order_uuid            as OrderUUID,
      order_id              as OrderID,
      email                 as Email,
      firstname             as Firstname,
      lastname              as Lastname,
      country               as Country,
      createon              as Createon,
      deliverydate          as Deliverydate,
      orderstatus           as Orderstatus,
      imageurl              as Imageurl,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      //Local ETAG field -->Odata Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // Total Etag field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      //  _association_name // Make association public
      _Items

}
