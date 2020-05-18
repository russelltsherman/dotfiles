# kubernetes local development

Steps to Setup

```sh
make brew
```

Start the cluster and initialize the tools.

```sh
minikube start
draft init
```

Use draft create for the first time, it will generate a Docker file and Helm chart.
Customize it according to your project needs. (One time only)

```sh
draft create -p go
```

Use draft up to deploy the app to a Kubernetes cluster.

```sh
draft up
```

Your application will be deployed to the hostname provided in the ingress.
Add that path to your DNS file and direct it to the Minikube IP.

Find on which IP Minikube is running.

```sh
minikube ip
```

For Mac and Linux users, update/etc/host
