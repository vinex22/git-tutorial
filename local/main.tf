provider "local" {

  
}

resource "local_file" "game" {
  filename = "v.txt"
  content = "fifa 2023"
}