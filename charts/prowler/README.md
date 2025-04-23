<!-- 
This README is the one shown on Artifact Hub.
Images should use absolute URLs.
-->

# Prowler Helm Chart

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square)
![AppVersion: 5.5.1](https://img.shields.io/badge/AppVersion-5.5.1-informational?style=flat-square)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/prowler-app)](https://artifacthub.io/packages/helm/prowler-app/prowler)

Prowler is an Open Cloud Security tool for AWS, Azure, GCP and Kubernetes. It helps for continuos monitoring, security assessments and audits, incident response, compliance, hardening and forensics readiness. Includes CIS, NIST 800, NIST CSF, CISA, FedRAMP, PCI-DSS, GDPR, HIPAA, FFIEC, SOC2, GXP, Well-Architected Security, ENS and more.

This is a Chart for the [Prowler App](https://docs.prowler.com/projects/prowler-open-source/en/latest/#prowler-app), not the [Prowler Dashboard](https://docs.prowler.com/projects/prowler-open-source/en/latest/#prowler-dashboard).

## Architecture

The Prowler App consists of three main components:

- **Prowler UI**: A user-friendly web interface for running Prowler and viewing results, powered by Next.js.
- **Prowler API**: The backend API that executes Prowler scans and stores the results, built with Django REST Framework.
- **Prowler SDK**: A Python SDK that integrates with the Prowler CLI for advanced functionality.

The app leverages the following supporting infrastructure:

- **PostgreSQL**: Used for persistent storage of scan results.
- **Celery Workers**: Facilitate asynchronous execution of Prowler scans.
- **Valkey**: An in-memory database serving as a message broker for the Celery workers.

![prowler architecture](https://promptlylabs.github.io/prowler-helm-chart/docs/images/architecture.png)

## Setup

Prowler requires an existing PostgreSQL database and a DB user with the necessary permissions to create tables and run migrations.

On startup, the Prowler API will run migrations and create a new user defined on the following environment variable:

```yaml
POSTGRES_USER: prowler
POSTGRES_PASSWORD: prowler_password
```

This Chart uses Bitnami's Charts to deploy [PostgreSQL](https://artifacthub.io/packages/helm/bitnami/postgresql) and [Valkey](https://artifacthub.io/packages/helm/bitnami/valkey), but keep in mind, this is not production ready. Going this way, the Chart sets up the secrets for Prowler to connect to the PostgreSQL database and Valkey.

To connect to existing PostgreSQL and Valkey instances. Create `Secrets` containing the correct credentials, as specified in the `values.yaml` file.

## Contributing

Feel free to contact the maintainer of this repository for any questions or concerns. Contributions are encouraged and appreciated.
