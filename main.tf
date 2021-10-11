resource "aci_rest" "mgmtOoB" {
  dn         = "uni/tn-mgmt/mgmtp-default/oob-${var.name}"
  class_name = "mgmtOoB"
  content = {
    name = var.name
  }
}

resource "aci_rest" "mgmtRsOoBProv" {
  for_each   = toset(var.oob_contract_providers)
  dn         = "${aci_rest.mgmtOoB.dn}/rsooBProv-${each.value}"
  class_name = "mgmtRsOoBProv"
  content = {
    tnVzOOBBrCPName = each.value
  }
}
