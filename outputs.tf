output "cluster_endpoint" {
  description = "eks control plane endpoint"
  value      = module.eks.cluster_endpoint

}
output "cluster_id" {
  description = "eks cluster id"
  value       = module.eks.cluster_id
}

output "cluster_name" {
  description = "eks cluster Name"
  value       = local.cluster_name
}
