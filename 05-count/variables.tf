variable "instances" {
  type        = list(string)
  description = "Instances"
  default     = ["dev", "test", "qa"]
}