variable "json_file" {
  description = "Path to the JSON file containing team members."
  type        = string
}

variable "github_token" {
  description = "GitHub access token used to configure the provider"
  type        = string
}

variable "owner_name" {
  description = "Oganisation name where team will be created"
  type        = string
}
