BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
LOCAL_IP := $(shell ip route get 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')


init:
	terraform -chdir="${BASEDIR}/vault" init
	terraform -chdir="${BASEDIR}/injector" init

vault-up:
	nohup vault server \
		-dev \
		-dev-root-token-id root \
		-dev-listen-address 0.0.0.0:8200 &

vault-down:
	pkill vault

vault-provision:
	terraform -chdir="${BASEDIR}/vault" apply \
		-auto-approve \
		-var "vault_address=http://${LOCAL_IP}:8200" \
		-var "vault_token=root"

minikube-up:
	minikube start \
		--nodes 1 \
		--cpus 4 \
		--memory 8192 \
		--driver virtualbox \
		--apiserver-port 8443 \
		--kubernetes-version 1.19.12 \
		--profile vault

minikube-down:
	minikube delete --profile vault

injector-provision:
	terraform -chdir="${BASEDIR}/injector" apply \
		-auto-approve \
		-var "vault_address=http://${LOCAL_IP}:8200" \
		-var "vault_role_id=$(shell terraform -chdir=${BASEDIR}/vault output role_id)" \
		-var "vault_secret_id=$(shell terraform -chdir=${BASEDIR}/vault output secret_id)" \
		-var "kubernetes_endpoint=https://$(shell minikube --profile=vault ip):8443" \
		-var "kubectl_context=vault"
