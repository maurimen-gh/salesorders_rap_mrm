@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Orders - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZORDERS_C_5902
  provider contract transactional_query
  as projection on ZORDERS_R_5902
{
  key OrderUUID,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZORDERS_R_5902', element: 'OrderID' },
                                            additionalBinding: [ { localElement: 'Email',
                                                                   element: 'Email',
                                                                   usage: #RESULT },
                                                                 { localElement: 'Firstname',
                                                                   element: 'Firstname',
                                                                   usage: #RESULT } ],
                                            useForValidation: true } ]
      @Search.defaultSearchElement: true
      OrderID,
      
     @Consumption.valueHelpDefinition: [ { entity: { name: 'ZORDERS_R_5902', element: 'Email' },
                                           additionalBinding: [ { localElement: 'Firstname',
                                                           element: 'Firstname',
                                                           usage: #RESULT },
                                                         { localElement: 'Lastname',
                                                           element: 'Lastname',
                                                           usage: #RESULT } ] } ]
      @Semantics.eMail.address: true
      Email,
      
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZORDERS_R_5902', element: 'Firstname' },
                                            additionalBinding: [ { localElement: 'Lastname',
                                                                   element: 'Lastname',
                                                                   usage: #RESULT },
                                                                 { localElement: 'Email',
                                                                   element: 'Email',
                                                                   usage: #RESULT } ] } ]
      @Semantics.name.prefix: true
      Firstname,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZORDERS_R_5902', element: 'Lastname' },
                                            additionalBinding: [ { localElement: 'Firstname',
                                                                   element: 'Firstname',
                                                                   usage: #RESULT },
                                                                 { localElement: 'Email',
                                                                   element: 'Email',
                                                                   usage: #RESULT } ] } ]
      @Semantics.name.suffix: true
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
