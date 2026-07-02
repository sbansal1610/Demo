# Fiori Floor Plan

Guide the user to select, design, or implement the correct SAP Fiori floor plan for a given use case.

## What is a Fiori Floor Plan

A Fiori floor plan is a standardized UI pattern defined by SAP that prescribes the layout, navigation structure, and interaction model for a specific type of task. Choosing the right floor plan ensures consistency, usability, and alignment with SAP UX guidelines.

## Available floor plans

### List Report + Object Page (most common)
- **When to use:** Browse a large list of business objects (orders, invoices, materials) and drill into a single object to view or edit its details.
- **Structure:** `ListReport` (table with SmartFilterBar) → `ObjectPage` (sections and subsections with SmartForms/Tables).
- **Tech:** Fiori Elements with OData v4, annotations `@UI.lineItem`, `@UI.selectionFields`, `@UI.facets`, `@UI.fieldGroup`.
- **Sales Order fit:** Default pattern — list of sales orders → order detail with items, schedule lines, partners.

### Overview Page (OVP)
- **When to use:** Give a role-based, at-a-glance summary across multiple entities using cards (KPI, list, table, chart).
- **Structure:** Dashboard of cards, each bound to its own OData entity set.
- **Tech:** Fiori Elements OVP, card annotations (`@UI.headerInfo`, `@UI.chart`), multiple data sources.
- **Sales Order fit:** Sales manager cockpit — open orders KPI, revenue chart, blocked orders list card.

### Analytical List Page (ALP)
- **When to use:** Combine analytical charts with a transactional list so users can filter by chart selections and drill into records.
- **Structure:** Chart panel (top) + table panel (bottom), shared filter bar.
- **Tech:** Fiori Elements ALP, `@UI.chart`, `@UI.presentationVariant`, `@Aggregation` annotations.
- **Sales Order fit:** Sales analysis — revenue by region chart linked to order line-item table.

### Worklist
- **When to use:** Process a predefined, finite list of items that need attention (approve, reject, complete). No complex filtering needed.
- **Structure:** Single table, no SmartFilterBar, action buttons per row.
- **Tech:** Fiori Elements Worklist template or freestyle SAPUI5 `sap.m.Table`.
- **Sales Order fit:** Order approval queue — reviewer sees orders awaiting approval and acts inline.

### Wizard
- **When to use:** Guide users through a multi-step process where each step depends on the previous one (create with configuration).
- **Structure:** Step navigator + content area per step + summary/confirmation step.
- **Tech:** `sap.m.Wizard` control, or Fiori Elements Create with `@UI.createHidden` and guided creation.
- **Sales Order fit:** New order creation wizard — customer → items → delivery → review → submit.

### Flexible Column Layout (FCL)
- **When to use:** Allow users to work on list and detail simultaneously without full-page navigation (master-detail side by side).
- **Structure:** Up to 3 columns visible at once (list | detail | sub-detail).
- **Tech:** `sap.f.FlexibleColumnLayout`, `ColumnListItem` with `press` routing.
- **Sales Order fit:** Order list alongside order details and item details in three columns.

## Selecting a floor plan — decision guide

| Primary task | Recommended floor plan |
|---|---|
| Browse + view/edit one object | List Report + Object Page |
| Role dashboard / KPI overview | Overview Page |
| Analyze data + act on records | Analytical List Page |
| Process a work queue | Worklist |
| Create via guided steps | Wizard |
| Side-by-side list + detail | Flexible Column Layout |

## When reviewing UI designs or specs

- Confirm the chosen floor plan matches the primary user task.
- Flag mismatches (e.g., using a Worklist when complex filtering is needed → switch to List Report).
- Check that OData annotations align with the floor plan: missing `@UI.lineItem` breaks List Report, missing `@UI.facets` breaks Object Page.

## When generating UI code or annotations

- State the chosen floor plan and justify it against the use case.
- Provide the key CDS annotations needed for that floor plan.
- Include a minimal `manifest.json` snippet with the correct `"template"` setting.
- Note any Fiori Elements version constraints (v2 vs v4 OData).

$ARGUMENTS
