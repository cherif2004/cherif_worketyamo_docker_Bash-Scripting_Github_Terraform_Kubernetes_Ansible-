provider "github" {
  token = var.github_token
}

resource "github_repository" "myrepo" {
    name = "WORKETYAMO-Exercise"
    description = " WORKETYAMO : creer un repository github à partir d'un script  terraform"
    visibility = "public"
  
}