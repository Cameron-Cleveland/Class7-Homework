resource "local_file" "bam_check" {
  content  = "BAM Challenge 3/17 - Deployment Successful"
  filename = "${path.module}/success.txt"
}
