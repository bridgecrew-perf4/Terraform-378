#resource "aws_instance" "ec2_test" {
#  ami = "ami-05d1b0b938144501e"
#  instance_type = "t3.nano"
#  vpc_security_group_ids = [ 
#    aws_security_group.blogPublicSG.id,
#   ]
#  subnet_id = aws_subnet.blogPublicSubnet.id
#  key_name = aws_key_pair.ec2_key.eks
#  root_block_device {
#    volume_size = 30
#    volume_type = "gp3"
#  }
#}

resource "aws_launch_configuration" "myLaunchConfig" {
    image_id = "ami-027ce4ce0590e3c98"
    instance_type = "t2.micro"
    key_name        = "eks"

    security_groups = [ aws_security_group.myweb_sg.id ]
    user_data = <<-EOF
        #!/bin/bash
        sudo yum install httpd -y
        echo "<html><h1>webpage 1</h1></html>" | sudo tee /var/www/html/index.html
        sudo sed -i '136s/80/8080/g' /etc/httpd/conf/httd.conf
        sudo service httpd start
        sudo chkconfig httpd on
    EOF

    lifecycle {
        create_before_destroy = true
    }
    depends_on = [ aws_security_group.myweb_sg ]
}
