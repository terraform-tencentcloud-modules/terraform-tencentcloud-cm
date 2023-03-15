# CDN Module Example

This module will create new CDN domain.

## Usage

To run this example, you need first replace the configuration like `domain`, `service_type` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| project_id | Project CDN belongs to. |
| cname | CNAME address of domain name. |
| create_time | Domain name creation time. |
| status | Acceleration service status. |
