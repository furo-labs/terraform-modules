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
  pull_repos     = try(local.team_data.repos.pull, [])

  uniq_members = distinct(concat(local.maintainers, local.members))
  uniq_repos   = distinct(concat(local.admin_repos, local.maintain_repos, local.push_repos, local.triage_repos, local.pull_repos))

  parent_team_slug = try(lower(replace(local.team_data.parent_team_name, " ", "-")), null)
  parent_team_id   = try(data.github_team.parent[0].id, null)

  team_privacy = try(local.team_data.team_privacy, "closed")
}

data "github_team" "parent" {
  count = local.parent_team_slug == null ? 0 : 1
  slug  = local.parent_team_slug
}

resource "github_team" "team" {
  name           = local.team_name
  description    = local.team_description
  privacy        = local.team_privacy
  parent_team_id = local.parent_team_id
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
  permission = contains(local.admin_repos, each.key) ? "admin" : contains(local.maintain_repos, each.key) ? "maintain" : contains(local.push_repos, each.key) ? "push" : contains(local.triage_repos, each.key) ? "triage" : contains(local.pull_repos, each.key) ? "pull" : "pull"
}
