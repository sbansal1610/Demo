# Cloudification

Guide the user to design or migrate SAP workloads following cloudification best practices for SAP BTP and S/4HANA Cloud.

## What is Cloudification

Cloudification is the process of moving SAP on-premise workloads and custom extensions to cloud-native architectures on SAP BTP (Business Technology Platform) or SAP S/4HANA Public/Private Cloud, applying cloud principles: elasticity, managed services, API-first, and DevOps delivery.

## Key cloudification patterns

### Side-by-side extensions (preferred)
- Build new apps and extensions on SAP BTP instead of inside the SAP core.
- Use CAP (Cloud Application Programming Model) for backend services.
- Expose functionality via OData or REST APIs consumed by Fiori/UI5 frontends.
- Connect back to S/4HANA via SAP Cloud Connector or Event Mesh, never direct DB connections.

### API-first integration
- Replace point-to-point RFC/BAPI calls with SAP Integration Suite (CPI) flows or Event-Driven Architecture using SAP Event Mesh.
- Use published S/4HANA OData APIs (API Business Hub) as the integration contract.
- Avoid synchronous tight coupling; prefer async events where possible.

### DevOps and CI/CD
- Source code in Git (GitHub, GitLab, or Azure DevOps).
- Use SAP Cloud Transport Management (cTMS) for transport orchestration.
- Pipeline steps: lint → unit test → integration test → transport → smoke test.
- ABAP: use abapGit and ABAP Pipeline for CI/CD.

### Managed services over custom infrastructure
- Use SAP HANA Cloud (managed) instead of on-premise HANA.
- Use SAP Build Work Zone for launchpad instead of on-premise Fiori Launchpad.
- Use SAP Datasphere or Analytics Cloud instead of custom reporting infra.

## When reviewing architecture or code

- Identify any tight coupling to on-premise infrastructure (direct DB, RFC, hard-coded hostnames).
- Flag sync patterns that should be async; suggest Event Mesh or Integration Suite.
- Check that extensions live in BTP, not in the SAP core.
- Recommend the appropriate BTP service for the workload (CAP, HANA Cloud, Build Apps, etc.).

## When generating code or architecture

- Default to CAP (Node.js or Java) for new BTP services.
- Use OData v4 for API exposure.
- Define services in CDS (`.cds` files) with proper annotations.
- Include a basic `mta.yaml` for multi-target app deployment.
- Show how to bind to S/4HANA destination via `destinations` in `package.json` / `xs-app.json`.

$ARGUMENTS
