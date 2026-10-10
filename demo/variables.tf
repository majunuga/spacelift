variable "instance_count" {
  description = "Number of Lightsail instances"
  type        = number
  default     = 3
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "us-west-2a"
}
