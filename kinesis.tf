module "kinesis_stream" {
  source      = "./modules/kinesis"
  for_each    = local.envs
  name        = each.value.name
  on_demand   = each.value.on_demand
  shard_count = try(each.value.shard_count, null)
}

locals {
  envs = {
    dev = {
      name        = "dev"
      on_demand   = false
      shard_count = 4
    },

    prod = {
      name        = "prod"
      on_demand   = false
      shard_count = 4
    }
  }
}

