resource "local_file" "test" {
    content  = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    filename = "${path.root}/test1.txt"
}
