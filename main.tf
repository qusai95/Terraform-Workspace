provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-3434hj2343"
    instance_type = lookup(var.instance_type, terraform.workspace)
}


variable "instance_type" {
    type = map(any)

    default  = {

        default = "t2.nano"
        staging = "t2.micro"
        production = "t2.large"
    }
}