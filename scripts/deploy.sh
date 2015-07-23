#!/bin/bash
# Script to rebuild image, push to repo andrefresh pods one at a time

cd ..
docker build -t gcr.io/prjmonday/demoapp  .
gcloud docker push gcr.io/prjmonday/demoapp

kubectl rolling-update sample --image=gcr.io/prjmonday/demoapp
