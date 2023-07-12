variable "REGION" {
  default = "us-east-2"

}
variable "ZONE1" {
  default = "us-east-2a"
}
variable "ZONE2" {
  default = "us-east-2b"
}
variable "ZONE3" {
  default = "us-east-2c"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-024e6efaf93d85776" #ubuntu
    us-east-1 = "ami-053b0d53c279acc90" #redhat
  }
}
variable "USER" {
  default = "ubuntu"

}
variable "PUB_KEY" {
  default = "sanikey.pub"

}
variable "PRIV_KEY" {
  default = "sanikey"

}
variable "MYIP" {
  default = "85.191.213.186/32"

}
