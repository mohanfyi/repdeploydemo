docker build -t gcr.io/prjmonday/july23sample1version3  .
gcloud docker push gcr.io/prjmonday/july23sample1version3

kubectl rolling-update sample --image=gcr.io/prjmonday/july23sample1version3
