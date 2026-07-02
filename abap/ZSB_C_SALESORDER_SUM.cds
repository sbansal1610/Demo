@EndUserText.label: 'Sales Order Summary by Sales Organization'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

/*
 * Aggregation view: powers the "Summary" tab chart in the List Report.
 * OData V4 $apply transforms (groupby + aggregate) are applied at runtime;
 * this view declares which fields may be grouped / aggregated.
 */

@Aggregation.ApplySupported: {
  Transformations:        [#AGGREGATE, #GROUPBY, #FILTER, #SEARCH],
  AggregatableProperties: [{ Property: SalesOrderCount }],
  GroupableProperties:    [SalesOrganization, SalesOrderType, CreationDate]
}

@UI.chart: [{
  title:          'Sales Orders by Organization',
  chartType:      #BAR,
  dimensions: [{
    value: 'SalesOrganization',
    role:  #CATEGORY
  }],
  measures: [{
    value: 'SalesOrderCount',
    role:  #AXIS_1
  }]
}]

@UI.presentationVariant: [{
  visualizations: [{type: #AS_CHART}]
}]

define view entity ZSB_C_SALESORDER_SUM
  as select from ZSB_R_SALESORDER
{
  @UI.selectionField: [{ position: 10 }]
  SalesOrganization,

  SalesOrderType,

  @UI.selectionField: [{ position: 30 }]
  CreationDate,

  /* COUNT_DISTINCT on SalesOrder = number of unique orders per grouping key */
  @Aggregation.default: #COUNT_DISTINCT
  @UI.dataPoint: { title: 'Number of Orders', value: 'SalesOrderCount' }
  @EndUserText.label: 'Number of Sales Orders'
  SalesOrder as SalesOrderCount
}
