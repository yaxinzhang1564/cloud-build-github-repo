resource "local_file" "bogus-github-zzz-exp-project" {
  content = "bogus github zzz exp"
  filename = "${path.root}/result_files/001.bogus-github-zzz-exp-project.txt"
}
