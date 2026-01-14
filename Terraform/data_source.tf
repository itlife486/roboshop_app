data "aws_ami" "redhat_linux" {
   #most_recent = true 
      filter {
       name = "name"
       values = [var.map_ami_config["name"]]
    }
      filter {
        name = "architecture"
        values = [var.map_ami_config["architecture"]]
      }
}
