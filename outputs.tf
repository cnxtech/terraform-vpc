output "vpc_id" {
  description = "VPC resource identifier"
  value       = "${aws_vpc.main.id}"
}

output "subnet_ids" {
  description = "List of subnet identifiers"
  value       = "${aws_subnet.public.*.id}"
}
