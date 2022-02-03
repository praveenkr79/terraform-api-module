
output "root_api_id" {
  value = aws_api_gateway_rest_api.root_api.id
}


output "root_api_resource_id" {
  value = aws_api_gateway_rest_api.root_api.root_resource_id
}

output "api_gateway_domain_name" {
  value = aws_api_gateway_domain_name.east
}