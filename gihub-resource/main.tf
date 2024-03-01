resource "github_repository" "terraform-repo" {
  name        = "terraform-repo-1st"
  description = "Repo created using terraform"
  visibility  = "public"
}

resource "github_repository" "terraform-repo1" {
  name        = "terraform-repo-2nd"
  description = "Repo created using terraform"
  visibility  = "public"
}
output "html_url" {
  value = github_repository.terraform-repo.html_url

}

