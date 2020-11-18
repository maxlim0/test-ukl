<h5>What is that?</h5>
Kubernetes cluster deployment PoC using GitOps and IaC approaches.

<h5>How that works?</h5>
The k8s installations described in TF files.
TF executer and state file on Terraform cloud side.
<br>
There are two CI actions: on PR to master and on PUSH to master.
<br>
PR-to-master: will perform the TF linter, to do check the TF states.
Here can be some test in real life example. 
<br>PUSH-to-master: will execute tf apply and deploy the infra.

<h5>What does done here?</h5>
* K8S cluster with one worker node on node-pool.
* Custom private VPC.
* Helm chart with nginx-ingress as Internal loadbalancer installation 
* GitHub Actions as CI part

<h5>How to install?</h5>
You should have: 
* GitHub account
* Terraform Cloud account
* GCP with GKE access.

1. Create github repository secrets with: TF Cloud access token  and put to github secrets.
2. Create GCP service account with GKE API access and put to github secrets.
3. Put GKE API service account in TF Cloud variables.
