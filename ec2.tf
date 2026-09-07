# Key-Pair
/*
resource "aws_key_pair" "my_key" {
#     key_name = "terra-key-ec2"
#     public_key = file("terra-key-ec2.pub")
# }

# # VPC and Security Group

# resource "aws_default_vpc" "default" {

# }

# resource "aws_security_group" "my_security_group" {
#     name = "terra-sg"
#     description =  "This is SG of terra-ec2"
#     vpc_id = aws_default_vpc.default.id

#     # inbound rules 
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol ="tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#         description = "Allow SSH access"
#     }

#     # inbound rules for HTTP access
#     ingress {
#         from_port = 80
#         to_port = 80
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#         description = "Allow HTTP access"
#     }

#     # inbound access for HTTPS access
#     ingress {
#         from_port = 443
#         to_port = 443
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#         description = "Allow HTTPS access"
#     }

#     # outbound access 
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     }
    
# resource "aws_instance" "my_ec2_instance" {
#     key_name = aws_key_pair.my_key.key_name
#     vpc_security_group_ids = [aws_security_group.my_security_group.id]
#     instance_type = "t3.micro"
#     ami = "ami-0b6d9d3d33ba97d99"

#     root_block_device  {
#         volume_size = 8
#         volume_type = "gp3"
#     }

#     tags = {
#         Name = "terra-ec2"
#     }
# }
# */

# # Key-Pair

# resource "aws_key_pair" "my_key" {
#     key_name = "regbi-terra-key"
#     public_key = file("regbi-terra-key.pub")
# }

# # VPC and Security Group

# resource "aws_default_vpc" "default" {
# }

# resource "aws_security_group" "my_sg" {
# 	name = "regbi-terra-sg"
# 	description = "SG for regbis"
# 	vpc_id = aws_default_vpc.default.id

# 	ingress {
# 		from_port = 22
# 		to_port = 22
# 		protocol = "tcp"
# 		cidr_blocks = ["0.0.0.0/0"]
# 		description = "Allow SSH access"
# }

# 	ingress {
# 		from_port = 8000
# 		to_port = 8000
# 		protocol = "tcp"
# 		cidr_blocks = ["0.0.0.0/0"]
# 		description = "allow port 8000"
# }

# 	egress {
# 		from_port = 0
# 		to_port = 0
# 		protocol = "tcp"
# }
# }

# resource "aws_instance" "my_ec2_instance" {
# 	key_name = aws_key_pair.my_key.key_name
# 	vpc_security_group_ids = [aws_security_group.my_sg.id]
# 	instance_type = "t3.micro"
# 	ami = "ami-0b6d9d3d33ba97d99"

# 	root_block_device {
# 		volume_size = 8
# 		volume_type = "gp2"
#     }

# 	tags = {
# 		Name = "regbi-terra-ec2"
#     }
# }


resource "aws_key_pair" "my_key" {
    key_name = "terraform-in-one-shot-key"
    public_key = file("terraform-in-one-shot.pub")
}

resource "aws_default_vpc" "default" {
    
}

resource "aws_security_group" "my_sg" {
    name = "terraform-in-one-shot.sg"
    description = " security group in terraform-in-one-shot"
    vpc_id = aws_default_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH open"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
}

resource "aws_instance" "my_ec2_instance" {
    count = 5 #meta argument
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami
    user_data = file("install_nginx.sh")
    root_block_device {
        volume_size = var.ec2_root_size
        volume_type= "gp2"
    }

    tags = {
        Name = "terraform-in-one-shot-ec2"
    }
}
