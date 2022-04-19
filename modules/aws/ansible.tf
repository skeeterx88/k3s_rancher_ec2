resource "null_resource" "ansible" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
   command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key Key.pem -i ansible/aws_ec2.yaml ansible/playbook.yaml"
  }
}
