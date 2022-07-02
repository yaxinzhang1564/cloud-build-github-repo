resource "local_file" "test1" {
    content  = "foo!"
    filename = "${path.root}/test1.txt"
}