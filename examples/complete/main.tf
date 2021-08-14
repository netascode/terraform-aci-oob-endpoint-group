module "aci_oob_endpoint_group" {
  source = "netascode/oob-endpoint-group/aci"

  name = "OOB1"
  oob_contracts = {
    providers = ["OOB-CON1"]
  }
}
