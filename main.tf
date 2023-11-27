provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0fc5d935ebf8bc3bc" # us-west-1
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
