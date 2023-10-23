terraform {
  #   backend "s3" {
  #     bucket         = "347000532987-organisation-team-config"
  #     key            = "furo-migrations-emu/furo-migrations-emu/terraform.tfstate"
  #     region         = "ap-southeast-1"
  #     dynamodb_table = "347000532987-organisation-team-config"
  #   }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
