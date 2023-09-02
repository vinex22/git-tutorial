provider "local" {

  
}
resource "local_file" "things-to-do" {
  filename     = "things-to-do.txt"
  content  = "Clean my room before Christmas\nComplete the CKA Certification!"
}
resource "local_file" "more-things-to-do" {
  filename     = "more-things-to-do.txt"
  content  = "Learn how to play Astronomia on the guitar!"
}

resource "local_sensitive_file" "sens" {
   filename     = "sens.txt"
  content  = "Learn how to play Astronomia on the guitar!"
}