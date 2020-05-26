# assignment
Simple nodjs app in Kubernetes in AWS using Terraform
 - Cluster is running 10 replicas
 - Deployment autoscaling at 50% cpu & 60% memory
 - Custom docker image hosted on ECR called nodejs-test:latest is used for deployment
 - Image pull is taken care by IAM (kops attaced the policy for for download images from ecr at them time of cluster creation) 
 - App is exposed at port 3000
 - hpa is configured with min 7 & max 10 to ensure 7 replicas are running at any point of time
 - higher priority is set than daemonset pods
 - Terrafom is used to write task as code
 - Load test result is included

#### Assumptions
  -    kubernets Version 1.18.0+
  -    kubernetes cluster created using kops 
  -    terraform version 0.12
  -    kops version 1.16.0
  
#### Deployment

```
terrafrom init 
terraform apply -auto-approve

#for loadtest
kubectl apply -f loadtest-job.yaml

```




##### Loadtest Benchmark

```
Transactions:		            1838381 hits
Availability:		              99.97 %
Elapsed time:		             419.95 secs
Data transferred:	            85.91 MB
Response time:		             0.02 secs
Transaction rate:	          4377.62 trans/sec
Throughput:		             0.20 MB/sec
Concurrency:		              99.15
Successful transactions:            1838381
Failed transactions:                    478
Longest transaction:                  12.18
Shortest transaction:                  0.00
```
