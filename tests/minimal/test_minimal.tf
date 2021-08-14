terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "OOB1"
}

data "aci_rest" "mgmtOoB" {
  dn = "uni/tn-mgmt/mgmtp-default/oob-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtOoB" {
  component = "mgmtOoB"

  equal "name" {
    description = "name"
    got         = data.aci_rest.mgmtOoB.content.name
    want        = module.main.name
  }
}
