variable "ec2_instance_type" {
    default = "t3.micro"
    type = string
}

variable "ec2_ami" {
    default = "ami-0b6d9d3d33ba97d99"
    type = string
}

variable "ec2_root_size" {
    default = 8
    type = number
}