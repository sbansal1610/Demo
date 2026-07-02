# Clean Core

Guide the user to implement or review code following SAP's Clean Core principles for S/4HANA.

## What is Clean Core

Clean Core means keeping the SAP S/4HANA system free of modifications, using only SAP-approved extension methods so upgrades remain smooth and the system stays supportable.

## Principles to enforce

1. **No direct table access** — never SELECT/INSERT/UPDATE/DELETE on SAP standard tables directly from custom code. Always use released BAPIs, CDS views, or RAP business objects.
2. **No modifications to standard objects** — no changes to standard programs, function modules, classes, or includes. Use BAdIs, user exits, or enhancement spots instead.
3. **Use only released APIs** — check that every API used in the code is SAP-released (marked `@AbapCatalog.enhancement.category` or released in the API state). Warn on any use of internal/restricted APIs.
4. **Extension via RAP or BTP** — new functionality should be built on ABAP RESTful Application Programming Model (RAP) or SAP BTP side-by-side extensions, not core modifications.
5. **Separation of concerns** — custom logic must live in custom namespaces (Z* or Y* or customer namespace). Never mix with standard namespace objects.
6. **Upgrade compatibility** — flag any pattern that would break on an SAP upgrade (hardcoded internal table structures, direct DDIC type usage that may change, etc.).

## When reviewing code

- Identify any violation of the above principles and explain which clean core rule it breaks.
- Suggest the correct SAP-released alternative (BAPI, CDS view, BAdI, RAP BO, etc.).
- Note if a CDS view or API is released for the S/4HANA version in scope.

## When generating code

- Always use RAP business objects or released BAPIs/APIs.
- Use CDS views for data access; never raw SQL on standard tables.
- Place all custom objects in the Z/Y namespace.
- Add comments pointing to the released API or BAdI used.

$ARGUMENTS
