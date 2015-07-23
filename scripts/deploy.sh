#!/bin/bash
# Script to fetch latest changes from version control and refresh pods

cd ..
docker build -t gcr.io/prjmonday/july23sample1version3  .
gcloud docker push gcr.io/prjmonday/july23sample1version3

kubectl rolling-update sample --image=gcr.io/prjmonday/july23sample1version3
