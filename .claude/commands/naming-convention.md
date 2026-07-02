# Naming Convention

Enforce the project naming convention: all custom ABAP/SAP objects must start with the prefix **ZSB**.

## Prefix rule

| Object type | Pattern | Example |
|---|---|---|
| ABAP program | `ZSB_<NAME>` | `ZSB_SALES_ORDER_REPORT` |
| Function group | `ZSB_<NAME>` | `ZSB_SO_HELPERS` |
| Function module | `ZSB_<NAME>` | `ZSB_GET_SALES_ORDER` |
| Class | `ZCL_SB_<NAME>` | `ZCL_SB_SALES_ORDER` |
| Interface | `ZIF_SB_<NAME>` | `ZIF_SB_ORDER_PROCESSOR` |
| Exception class | `ZCX_SB_<NAME>` | `ZCX_SB_ORDER_ERROR` |
| CDS view | `ZSB_<NAME>` | `ZSB_C_SALESORDER` |
| CDS behavior definition | `ZSB_<NAME>` | `ZSB_C_SALESORDER` |
| Database table | `ZSB_<NAME>` | `ZSB_SALESORDER` |
| Structure | `ZSB_S_<NAME>` | `ZSB_S_ORDER_HEADER` |
| Table type | `ZSB_T_<NAME>` | `ZSB_T_ORDER_ITEMS` |
| Data element | `ZSB_<NAME>` | `ZSB_ORDER_STATUS` |
| Domain | `ZSB_<NAME>` | `ZSB_ORDER_STATUS_D` |
| Message class | `ZSB_<NAME>` | `ZSB_MESSAGES` |
| Enhancement spot | `ZSB_ES_<NAME>` | `ZSB_ES_SD_ORDER` |
| BAdI definition | `ZSB_BADI_<NAME>` | `ZSB_BADI_ORDER_CHECK` |
| Package | `ZSB_<NAME>` | `ZSB_SALES_ORDER` |

## Naming conventions beyond the prefix

- **Uppercase only** for all ABAP object names.
- **Snake_case with underscores** to separate words: `ZSB_CREATE_SALES_ORDER`, not `ZSBCREATESALESORDER`.
- **Domain suffix for DDIC**: append `_D` to domain names to distinguish from data elements.
- **No abbreviations unless standard SAP abbreviations** (e.g., `SO` for Sales Order, `PO` for Purchase Order, `BP` for Business Partner).
- **CDS view suffixes** (follow SAP naming tier convention):
  - `_R_` — restricted/base view: `ZSB_R_SALESORDER`
  - `_I_` — interface/composite view: `ZSB_I_SALESORDER`
  - `_C_` — consumption view: `ZSB_C_SALESORDER`

## When reviewing code

- Flag any custom object that does NOT start with `ZSB` (or the appropriate `ZCL_SB_`, `ZIF_SB_`, etc. variant).
- Flag abbreviations that are not standard SAP shorthand.
- Flag lowercase object names.
- Suggest the correctly prefixed name as a replacement.

## When generating code

- Apply the `ZSB` prefix (or variant) to every new custom object automatically.
- Follow the table above to pick the right sub-pattern for the object type.
- Never use `Z_` or `Y_` alone — always `ZSB_`.

$ARGUMENTS
