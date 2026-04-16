output "website_url" {
  description = "The URL of the application"
  value       = "http://${module.alb.alb_dns_name}"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
