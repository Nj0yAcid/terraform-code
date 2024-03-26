resource "aws_lightsail_instance" "server1" {
  name = "dev-server"
  availability_zone = "us-east_1a"
  blueprint_id = "centos_7_2009"
  bundle_id = "micro_1_0"
  key_pair_name = "devops"
  user_date = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1> This server has been launched by Acid </h1>" | sudo tee /etc/www/html/index.html
              EOF  
}