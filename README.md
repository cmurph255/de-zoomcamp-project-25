## Setup
1. Create a new project in GCP.
2. Go to IAM & Admin > Service Accounts, and create a new service account
3. Create a new json key for the service account
4. Save the key in the working directory with the name `.cred.json`
5. Enable the Compute Engine API. In the Cloud Console, go to "APIs & Services" > "Library," search for "Compute Engine API," and enable it.
6.  Under IAM & Admin > IAM, add the following roles to the newly created service account: 
    * Storage Admin
    * Storage Object Admin
    * BigQuery Admin
    * Compute Admin


Install Docker :
```bash
sudo apt-get update
sudo apt-get install wget
sudo apt-get install docker.io

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```


Configure docker to run without sudo:
```bash
sudo usermod -aG docker $USER
newgrp docker
```


On the VM, download the Kestra Docker Compose File:
```bash
curl -o docker-compose.yml \
https://github.com/cmurph255/de-zoomcamp-project-25/blob/main/kestra/docker-compose.yml
```
Launch kestra:
```bash
docker-compose up -d
```

Import the kestra flows from github so they are on the VM:
* Run the GCP_Key values to set your project key values (it can now write to gcp storage, bq) - make sure to set the credentials value to .cred.json
* DBT: sync with DBT in main project repo by running upload_dbt_project
* 

https://www.bls.gov/cps/cpsa2024.xlsx





