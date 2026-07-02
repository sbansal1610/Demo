@EndUserText.label: 'Sales Order List - Consumption View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

/*
 * Consumption view: drives the Fiori Elements List Report table.
 * Filter fields  : SalesOrganization (pos 10), Material via _Items (pos 20, manifest), CreationDate (pos 30)
 * Table columns  : SalesOrder, SalesOrderType, SalesOrganization, CreatedByUser, CreationDate
 */

@UI.headerInfo: {
  typeName: 'Sales Order',
  typeNamePlural: 'Sales Orders',
  title: {
    type: #STANDARD,
    value: 'SalesOrder'
  },
  description: {
    type: #STANDARD,
    value: 'SalesOrderType'
  }
}

@UI.presentationVariant: [{
  sortOrder: [{
    by:        'CreationDate',
    direction: #DESC
  }],
  visualizations: [{type: #AS_LINEITEM}]
}]

define view entity ZSB_C_SALESORDER
  as select from ZSB_I_SALESORDER
{
  /* ── Key ─────────────────────────────────────────────────────────── */
  @UI.lineItem:     [{ position: 10, importance: #HIGH,   label: 'Sales Order' }]
  @UI.identification: [{ position: 10 }]
  key SalesOrder,

  /* ── Table columns ───────────────────────────────────────────────── */
  @UI.lineItem:     [{ position: 20, importance: #MEDIUM, label: 'Order Type' }]
  SalesOrderType,

  @UI.selectionField: [{ position: 10 }]
  @UI.lineItem:     [{ position: 30, importance: #HIGH,   label: 'Sales Organization' }]
  SalesOrganization,

  @UI.lineItem:     [{ position: 40, importance: #MEDIUM, label: 'Created By' }]
  CreatedByUser,

  @UI.selectionField: [{ position: 30 }]
  @UI.lineItem:     [{ position: 50, importance: #MEDIUM, label: 'Created On' }]
  CreationDate,

  /* Material filter (position 20) is registered in manifest.json via
     _Items/Material navigation property — no denormalization needed. */
  _Items
}
