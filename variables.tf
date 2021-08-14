variable "name" {
  description = "OOB endpoint group name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}

variable "oob_contracts" {
  description = "List of OOB contracts."
  type = object({
    providers = optional(list(string))
  })
  default = {}

  validation {
    condition = alltrue([
      for prov in coalesce(var.oob_contracts.providers, []) : can(regex("^[a-zA-Z0-9_.-]{0,64}$", prov))
    ])
    error_message = "`providers`: Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}
