
resource "aws_instance" "roboshop_ec2" {
    count = var.env == "prod" ? length(var.instances): 0
    ami = data.aws_ami.redhat_linux.id
    instance_type = var.map_ami_config["ins_type"]
    vpc_security_group_ids = [aws_security_group.roboshop_ec2_sg.id]

    tags = {
        Name = "ops_${var.instances[count.index]}_${var.env}"
    }
} 

resource "aws_security_group" "roboshop_ec2_sg" { 
   # count = try(var.env == "prod" ? 1 :0)
    name = "roboshop_ec2_asg"
    description = "Allowing all inbound and outbound trafiic for ec2 instnaces"
   # vpc_id = aws_vpc_main.id
    tags = {
        Name = "roboshop_${var.env}_ec2_asg"
        Terraform = true
    }

    }

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_inbound" {
    security_group_id = aws_security_group.roboshop_ec2_sg.id
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_ip4_eg_rule" {
    security_group_id = aws_security_group.roboshop_ec2_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    #from_port = 0
    ip_protocol = "-1"
    #to_port = 0
}