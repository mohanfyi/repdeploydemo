#!/bin/bash
# Script to rebuild image, push to repo andrefresh pods one at a time

GCLOUD_PROJECT="prjmonday"
CLUSTER_NAME_SIMPLE="clsdemo"
CLUSTER_NAME_PARTIAL="gke-"$CLUSTER_NAME_SIMPLE-XXX-node"

cd ..
docker build -t gcr.io/$GCLOUD_PROJECT/demoapp  .
gcloud docker push gcr.io/$GCLOUD_PROJECT/demoapp

gcloud beta container --project $GCLOUD_PROJECT clusters create $CLUSTER_NAME_SIMPLE --zone "us-central1-f" --machine-type "n1-standard-1" --num-nodes "3" --network "default”

kubectl run kdemoapp --image=gcr.io/$GCLOUD_PROJECT/demoapp --port=8080

kubectl expose rc kdemoapp --create-external-load-balancer=true

#gcloud compute firewall-rules create kdemoapp-8080 --allow tcp:8080 --target-tags $CLUSTER_NAME_PARTIAL

