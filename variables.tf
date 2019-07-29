variable "project" {
  description = "Reference to a \"project\" module. See: https://registry.terraform.io/modules/PGBI/project/aws/"
}

variable "name" {
  type        = "string"
  description = "The name of the user."
}

variable "policies" {
  type        = map(object({ Action = list(string), Effect = string, Resource = list(string) }))
  description = "Map of policies to attach to the user. The map keys will be used to name the policies."
  default     = {}
}
