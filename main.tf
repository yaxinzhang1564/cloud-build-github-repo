resource "local_file" "test" {
    content  = "file is in github"
    filename = "${path.root}/test1.txt"
}
