output "id" {
  description = "Numeric ID of the team, used to reference this team in other modules."
  value       = github_team.team.id
}
