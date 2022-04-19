resource "tls_private_key" "chave" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.chave.public_key_openssh

  provisioner "local-exec" {
    command = "rm -rf ./Key.pem && echo '${tls_private_key.chave.private_key_pem}' > ./Key.pem && chmod 400 ./Key.pem"
  }
}