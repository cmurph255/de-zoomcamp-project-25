## Background:
This project analyzes U.S. county-level unemployment data from 2006- present using the Bureau of Labor Statistics' Local Area Unemployment Statistics (LAUS) data. The data includes key metrics such as labor force size, employment, unemployment counts, and unemployment rates for each county. Using various data technologies, we transformed and standardized yearly datasets for consistent loading into BigQuery. The resulting dataset supports geographic and time-based analysis of unemployment trends across the US.

https://www.bls.gov/lau/

![blshome](images/bls_home.png)


## Technology used:
In this capstone project, the following technologies are used:
* Terraform - IAC
* Google Cloud Platform (GCP) - main cloud provider
* Google Cloud Storage (GCS) - data lake storage
* BigQuery - data warehouse storage under GCP
* Docker - containerization (docker-compose)
* Kestra - main orchestration tool for data pipeline
* Python - minor data cleaning 
* DBT - ETL logic for BigQuery
* Looker Studio - Analytics and data visualizations


## Setup:
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

* SSH into the virtual machine and forward port 8080 to access the Kestra UI
* Import the kestra flows from github so they are on the VM:
    * create and run this flow:

```bash
id: sync_flows_from_git
namespace: git

tasks:
  - id: sync_flows
    type: io.kestra.plugin.git.SyncFlows
    url: https://github.com/cmurph255/de-zoomcamp-project-25.git
    branch: main
    targetNamespace: zoomcamp
    gitDirectory: flows
    dryRun: true
```

This will pull in the necessary Kestra flows for this project. 

* Run the "gcp_kv" flow to set your project key values (it can now write to gcp storage, bq) - make sure to set the credentials value to .cred.json
* Run the "upload_dbt_project" flow to sync with dbt project on Git
* Click on the main flow "unemployment_data_dl_test1" >> Triggers >> Backfill Executions.  Enter the backfill timeframe for years 2007-2024


## Dashboard Visualisation:
Now that the backfill has ran we can easily analyze the data using Looker Studio:

![state](images/state.png)

![county](images/county.png)





