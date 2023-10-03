output "__project_name" {
  value = local.project_name
}

output "dynamo_info" {
  value = module.dynamo
}

output "bucket_info" {
  value = module.bucket
}

output "server_info" {
  value = module.server
}
