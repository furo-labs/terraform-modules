# Team

Creates a Github team with defined members and corresponding roles.

<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

| Name | Version |
|------|---------|
| <a name="teams"></a> [teams](/modules/teams) | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [github_team.team](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_membership.members](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | List of members for the team and their role. For each member:<br>    - username: Github username.<br>    - role: (optional) the role granted to the team member. One of<br>        - member (default)<br>        - maintainer<br>        - owner | <pre>list(object({<br>    username = string<br>    role     = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_parent_team_id"></a> [parent\_team\_id](#input\_parent\_team\_id) | n/a | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Numeric ID of the team, used to reference this team in other modules. |
<!-- END_TF_DOCS -->