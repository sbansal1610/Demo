@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order - Interface View'
@Metadata.ignorePropagatedAnnotations: true

/*
 * Interface view: stable contract layer between the restricted base and the
 * consumption view. Add cross-cutting concerns (currency conversion, value helps,
 * additional associations) here without touching the restricted base.
 */
define view entity ZSB_I_SALESORDER
  as select from ZSB_R_SALESORDER
{
  key SalesOrder,
      SalesOrderType,
      SalesOrganization,
      CreatedByUser,
      CreationDate,

      _Items
}
