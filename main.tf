resource "aci_rest" "mgmtOoB" {
  dn         = "uni/tn-mgmt/mgmtp-default/oob-${var.name}"
  class_name = "mgmtOoB"
  content = {
    name = var.name
  }
}

resource "aci_rest" "mgmtRsOoBProv" {
  for_each   = toset(var.oob_contracts.providers != null ? var.oob_contracts.providers : [])
  dn         = "${aci_rest.mgmtOoB.id}/rsooBProv-${each.value}"
  class_name = "mgmtRsOoBProv"
  content = {
    tnVzOOBBrCPName = each.value
  }
}
