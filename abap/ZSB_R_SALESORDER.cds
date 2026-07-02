@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order - Restricted Base View'
@Metadata.ignorePropagatedAnnotations: true

/*
 * Restricted view: wraps the SAP-released I_SalesOrder API.
 * Exposes only the fields needed by this application (Clean Core - no VBAK direct access).
 * _Items association enables Material-based filtering at the OData level.
 */
define view entity ZSB_R_SALESORDER
  as select from I_SalesOrder

  /* Navigation to items — used for Material filter in the List Report */
  association [0..*] to I_SalesOrderItem as _Items
    on $projection.SalesOrder = _Items.SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      SalesOrganization,
      CreatedByUser,
      @Semantics.systemDate.createdAt: true
      CreationDate,

      /* Expose association so service definition can publish it */
      _Items
}
