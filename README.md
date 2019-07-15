# DockMeP - Docker Measurement Priorization Tool
Code for **Bachelor Thesis** from **Marko Stapfner**: Priority based Container Resource Management for Microservice Applications in the Cloud

## Basics Installation 
This will install Docker & Docker-Compose. 
Go to the `Setup` folder and run the `setup.sh` script using: `sh setup.sh`

## Local Monitoring Setup
For setting up the monitoring of the node on the node itself. 
Go to the `Monitoring` folder and run the `monitoring_setup.sh` script using `sh monitoring_setup.sh`
This will setup **Prometheus & Grafana** to monitor the node. Start Grafana using the browser: `http://URL:3000`. Username and password are `admin`. This should be changed after the initial start. 

## Benchmark Scripts
In the `CloudSuite` directory of this repo, several folders with shell scripts can be found, that will start benchmarking the standard applications.
For Example to run the In-Memory-Test-Application:
`sh run_in.sh`
After running the script, a cleanup has to be done, therefore use the provided cleanup script for each scenario.
`sh 

## Remote Server Scripts
For setting up the remote monitoring instance to monitor VMs independently. 
Go to the `Monitoring-Server-Setup` folder and start the `docker-compose.yml` file using: `docker-compose up -d`.

### Cleanup
Go to the `Setup` folder and run the `cleanup.sh` script using `sh cleanup.sh` to remove all docker related software.

## Evaluation of Data
For the evaluation of the data of each scenario that is stored in the InfluxDB Instance, use the Python scripts provided in the folders of the Scenarios under `Evaluation`. To run the script, for example type `sh scen1_evaluate.py`. This will generate plots and saves them in the `gen_images`folder. Also, these plots are directly shown. 
Prerequisites for running the scripts:
```shell
pip3 install matplotlib
pip3 install influxdb
```
