resource "aws_api_gateway_rest_api" "root_api" {
name ="public-api" 
endpoint_configuration {
    types = ["REGIONAL"]
  } 
}

resource "aws_api_gateway_resource" "api" {
  rest_api_id = aws_api_gateway_rest_api.root_api.id
  parent_id = aws_api_gateway_rest_api.root_api.root_resource_id
  path_part = "api"
  
}

resource "aws_api_gateway_domain_name" "east" {
  # var.regional_hostname = api-eu.example.com for eu-central-1
  domain_name = "east.uhcproviderdemo.com"

  regional_certificate_arn = "arn:aws:acm:us-east-1:323225961890:certificate/abfd3a89-5867-496d-b24e-d8289d841b7a"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}


resource "aws_api_gateway_base_path_mapping" "regional" {
  # The path, if not specified, is `/` by default
  api_id      = aws_api_gateway_rest_api.root_api.id 
  stage_name  = var.stage_name
  domain_name = aws_api_gateway_domain_name.east.domain_name
}