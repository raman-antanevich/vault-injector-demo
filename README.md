# Vault Injector: Demo

This repository has been created to help with demonstrating opportunities of Vault Injector in the Kubernetes cluster.


## Diagram

![Vault Injector](docs/diagram.png)



## Requirements

* Linux / MacOS
* [Vault](https://www.vaultproject.io/downloads)
* [Terraform](https://www.terraform.io/downloads.html)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* [Minikube](https://minikube.sigs.k8s.io/docs/start/)
* [make](https://man7.org/linux/man-pages/man1/make.1.html)



## Walkthrough

P.S. I will use `make` everywhere, but you can find all command in the `Makefile`.

Initialy, we should run the environment.

```sh
make up
```

Now we have running Kubernetes cluster (minikube) and Vault.
The next step is creating Vault policies, AppRole to create/setup Kubernetes auth backed and example secrets which we will retrieve later. All settings you can find in `vault/`.

```
make vault-provision
```

We're ready to deploy Vault Injector. All code locates in `injector/`.

```
make injector-provision
```

Great! Vault Injector is deployed successfully. But our containers won't be able to retrieve secrets from Vault, because we don't have kubernetes roles in Vault. Firstly, we need to uncomment code in `vault/vault_kubernetes.tf` and after that we should apply changes.

```
make vault-provision
```

That's it. We can retrieve secrets from Vault simple using Kubernetes annotations. All example you can find in `manifests/`.

To run a simple app:
```
kubectl apply -f manifests/simple-app.yml
```

To run a simple app without `vault.hashicorp.com/agent-inject-template`:
```
kubectl apply -f manifests/without-template.yml
```

To run a simple app with `vault.hashicorp.com/agent-inject-template`:
```
kubectl apply -f manifests/with-template.yml
```

To run a simple app with 2 secrets:
```
kubectl apply -f manifests/two-secrets.yml
```

To run a simple app in another namespace:
```
kubectl apply -f manifests/other-stage.yaml
```

To run a simple app with several replicas:
```
kubectl apply -f manifests/many-replicas.yml
```

Let's try to use disallow ServiceAccount and Namespace:
```
kubectl apply -f manifests/wrong-sa.yml

kubectl apply -f manifests/wrong-ns.yml
```

The end.



## Links

* Agent Sidecar Injector - [https://www.vaultproject.io/docs/platform/k8s/injector]()
* HashiCorp Vault: Delivering Secrets with Kubernetes - [https://medium.com/hashicorp-engineering/hashicorp-vault-delivering-secrets-with-kubernetes-1b358c03b2a3]()
* Injecting Vault Secrets Into Kubernetes Pods via a Sidecar - [https://www.hashicorp.com/blog/injecting-vault-secrets-into-kubernetes-pods-via-a-sidecar]()
