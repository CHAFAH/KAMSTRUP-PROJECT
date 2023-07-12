#resource "aws_key_pair" "key" {
#key_name   = "sanikey"
#ublic_key = file(var.PUB_KEY)

#}
resource "aws_instance" "kamstrup" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.medium"
  subnet_id              = aws_subnet.sani-pub-1.id
  key_name               = "SANI"
  vpc_security_group_ids = [aws_security_group.sani_sg.id]
  tags = {
    Name = "kamstrup"
  }

}
resource "aws_ebs_volume" "vol_4" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extra-vol"
  }

}
resource "aws_volume_attachment" "attach-vol-4" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4.id
  instance_id = aws_instance.kamstrup.id

}
output "map_public_ip_on_launch" {
  value = aws_instance.kamstrup.public_ip
}
