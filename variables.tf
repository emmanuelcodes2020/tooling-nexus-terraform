variable "vpc_id" {
  type = string
  default = "vpc-043e1dc52827b0366"
  
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t3.medium"
}

variable "key_name" {
  default = "londonserver"
  type    = string
}

variable "environment" {
  type        = string
  description = "environment"
  default     = "dev"
}

variable "ami_id" {
  type        = string
  description = "ami"
  default     = "ami-046d5130831576bbb"
}

variable "region" {
  type        = string
  description = "region to deploy"
  default     = "eu-west-2"
}

variable "vpc_security_group_ids" {
  type        = string
  description = "sg to allow access to app"
  default     = "tooling-nexus-sg"
}


variable "vpc_security_group_lb_ids" {
  type        = string
  description = "sg to allow http"
  default     = "tooling-nexus-lb-sg"
}

variable "load_balancer" {
  type        = string
  description = "load balancer"
  default     = "tooling-nexus-lb"
}

variable "lb_type" {
  type        = string
  description = "load balancer type"
  default     = "network"
}

variable "security_group_lb" {
  type        = string
  description = "security group load balancer"
  default     = "tooling-nexus-lb-sg"
}

variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-02a9e5d00bbb8cc25", "subnet-0644c8c5d8ada7398", "subnet-04fb6726c16bdd4ca"]
}

variable "availability_zones" {
  type        = list(string)
  description = "availabilty zones"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "zone_id" {
  type = string
  description = "zone id"
  default = "Z0671589BT7MHBSY40SQ"
}


variable "domain_name" {
  type = string
  description = "domain"
  default = "nexus.globalfrontierlink.co.uk"
}