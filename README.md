# iac-deploy

Manage Terraform resources with a single pipeline using the wrapper, Terragrunt. 

## pipelines

| job         | type      | description                                                               |
|-------------|-----------|---------------------------------------------------------------------------|
| `ssl_renew` | scheduled | automatically rotates `nginx_certificate` and triggers Ansible to deploy. |
