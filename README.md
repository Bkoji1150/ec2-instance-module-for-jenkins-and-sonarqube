# Ec2-instance-module-for-jenkins-and-sonarqube

This module set up the build of **JENKINS** and **SONARQUBE** instance.

This module was built using [koji-cookiecutter-microservice](git@github.com:Bkoji1150/ec2-instance.git).
<!-- prettier-ignore-start -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="require_terraform"></a>[terraform](#requiremnet\_terraform) | >=1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3, <4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.66.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="ec2-instance-module-for-jenkins-and-sonarqube"></a> [ec2\-instance\-module\-for\-jenkins\-and\-sonarqube](#module\_pr\_process\_participation\_api\_microservice) | git::ssh://git@github.com:Bkoji1150/ec2-instance-module-for-jenkins-and-sonarqube.git | tags/v0.1.0 |
| <a name="module_required_tags"></a> [required\_tags](#module\_required\_tags) | git::ssh://git@github.com:Bkoji1150/ec2-instance-module-for-jenkins-and-sonarqube.git | tags/v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.queens_key_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | resource |
| [random_integer.random](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | resource |
| [aws_ssm_parameter.cloud_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | resource |
| [aws_instance.jenkinsinstance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | resource |
| [aws_instance.SonarQubesinstance](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_owner"></a> [application\_owner](#input\_application\_owner) | Email Group for the Application owner. | `string` | `"kojibello058@gmail.com"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region. | `string` | `"us-east-1"` | no |
| <a name="input_builder"></a> [builder](#input\_builder) | Email for the builder of this infrastructure | `string` | `"devops@bellese.io"` | no |
| <a name="input_cell_name"></a> [cell\_name](#input\_cell\_name) | Name of the cell. | `string` | `"pr-process"` | no |
| <a name="input_component_name"></a> [component\_name](#input\_component\_name) | Name of the component. | `string` | `"jenkins-sonar-instance"` | no |
| <a name="input_jenkins_instance_name"></a> [jenkins\_instance\_name](#input\_instance\_name\_source) | what is the name of the instance.| `string` | `"n/a"` | no |
| <a name="input_sonarqube_instance_name"></a> [sonarqube\_instance\_name](#input\_instance\_name\_source) | what is the name of the instance.| `string` | `"n/a"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | what is the securiy group instance is using. | `list` | `n/a` | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id of jenkins instance app/web. | `string` | `n/a` | yes |
| <a name="input_keypair_name"></a> [key_pair\_name](#input\_key\_pair\_name) | keypair that would be used to connect to ec2 instance(would soon be depreciated). | `string` | `n/a` | no |

## Outputs
No outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- prettier-ignore-end -->
