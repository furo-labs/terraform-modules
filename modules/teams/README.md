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
| [github_team_repository.teams](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team.parent](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data |


## Inputs

Code block below represents the JSON input that is need for this module.
Optional objects can be ignored and not necessary to

``` json
{
    "team_name": "Test team",                   //(Mandatory) Name of the Team to be created
    "description": "Test team",                 //(Optional) Description of the team to be created
    "team_privacy": "secret",                   //(Optional) Defaulted to `closed` visile to all team members
    "parent_team_name": "Parent team Name"      //(Optional) Name of the parent team under which new team to be created as child.
                                                   // Defaulted to standalone team if noparent is provded.
    "maintainers": [                            //(Optional) Users to be added to team with maintainer role
      "user1",
      "user2"
    ],
    "members": [                                //(Optional) Users to be added to team with member role
      "user3",
      "user4",
      "user5"
    ],
    "repos": {
      "admin": [                               //(Optional) List of repositories to be added to team with admin permissions
        "repo1",
        "repo2"
      ],
      "maintain": [                            //(Optional) List of repositories to be added to team with maintain permissions
        "repo3",
        "repo4"
      ],
      "push": [                                //(Optional) List of repositories to be added to team with push/write permissions
        "repo5"
      ],
      "triage": []                             //(Optional) List of repositories to be added to team with triage permissions
    }
}

```
<br>

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Numeric ID of the team, used to reference this team in other modules. |
<!-- END_TF_DOCS -->