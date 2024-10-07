resource "aws_instance" "demo" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ "sg-0f674b765aee763af" ]

    provisioner "local-exec" {
         command = "echo ${self.private_ip} > private_ips.txt" #self is aws_instance.web
    }
  


    connection {

        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {

        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
}
