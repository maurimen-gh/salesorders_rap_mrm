@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items - Root entity'
@Metadata.ignorePropagatedAnnotations: true //false
define view entity ZITEMS_R_5902
  as select from zitems_5902

  association to parent ZORDERS_R_5902 as _Orders on $projection.OrderUUID = _Orders.OrderUUID
{
  key id                    as ItemUUID,
      parent_uuid           as OrderUUID,
      item_id               as ItemID,
      name                  as Name,
      description           as Description,
      releasedate           as Releasedate,
      discontinueddate      as Discontinueddate,
      price                 as Price,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      height                as Height,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      width                 as Width,
      depth                 as Depth,
      quantity              as Quantity,
      unitofmeasure         as Unitofmeasure,

      //Local ETAG field -->Odata Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Orders
}
