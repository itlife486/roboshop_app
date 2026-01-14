
variable  ami_name {
    type = string
    default =  "RHEL-9-DevOps-Practice"

    # validation {

    # condition = length(var.ami_name) <= 10
    # error_message = "The ami_name should be under 10 characters"
    
    # }
}

variable  ami_architecture {
    type = string
    default = "x86_64"
}

variable INS_type {
    type = string
    default = "t3.micro"
}

variable cidr {
    type = string
    default = "0.0.0.0/0"
}

variable map_ami_config {
    type = map
    default = {
        name = "RHEL-9-DevOps-Practice"
        architecture = "x86_64"
        ins_type = "t3.micro"
    }
}

variable "env" {
type    = string
default = "dev"
}


variable instances {
    type = map(string)
    default =  {
        fortend = "nginx"
        backend = ["catalouge,redis"]
        db      = ["mysql,mongodb"]
    }
}
