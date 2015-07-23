#!/bin/bash
# Script to fetch latest changes from version control and refresh pods

cd ..
docker build -t gcr.io/prjmonday/demoapp  .
gcloud docker push gcr.io/prjmonday/demoapp

kubectl rolling-update sample --image=gcr.io/prjmonday/demoapp
