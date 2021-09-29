module "aci_oob_endpoint_group" {
  source  = "netascode/oob-endpoint-group/aci"
  version = ">= 0.0.2"

  name                   = "OOB1"
  oob_contract_providers = ["OOB-CON1"]
}
