path "sys/auth" {
   capabilities = ["read"]
}

# for each Kubernetes cluster
path "auth/minikube/*" {
	capabilities = ["create", "read", "update", "delete"]
}

path "sys/auth/minikube" {
    capabilities = ["create", "update", "delete", "sudo"]
}
