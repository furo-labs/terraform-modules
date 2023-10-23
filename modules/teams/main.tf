locals {
  team_data = jsondecode(file(var.json_file))

  team_name        = local.team_data.team_name
  team_description = try(local.team_data.description, null)

  maintainers = try(local.team_data.maintainers, [])
  members     = try(local.team_data.members, [])

  admin_repos    = try(local.team_data.repos.admin, [])
  maintain_repos = try(local.team_data.repos.maintain, [])
  push_repos     = try(local.team_data.repos.push, [])
  triage_repos   = try(local.team_data.repos.triage, [])

  uniq_members = distinct(concat(local.maintainers, local.members))
  uniq_repos   = distinct(concat(local.admin_repos, local.maintain_repos, local.push_repos, local.triage_repos))

}


resource "github_team" "team" {
  name           = local.team_name
  description    = local.team_description
  parent_team_id = var.parent_team_id # needs to be added in input json and get the id using data source
}

resource "github_team_membership" "members" {
  for_each = toset(local.uniq_members)
  team_id  = github_team.team.id
  username = each.key
  role     = contains(local.maintainers, each.key) ? "maintainer" : "member"
}

resource "github_team_repository" "teams" {
  for_each   = toset(local.uniq_repos)
  team_id    = github_team.team.id
  repository = each.key
  permission = contains(local.admin_repos, each.key) ? "admin" : contains(local.maintain_repos, each.key) ? "maintain" : contains(local.push_repos, each.key) ? "push" : contains(local.triage_repos, each.key) ? "triage" : "pull"
}