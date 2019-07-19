# For spark cluster, docker image used from https://github.com/jupyter/docker-stacks for Jupyter Notebook Python, Spark, Mesos Stack
FROM jupyter/pyspark-notebook

# This is to copy yelp dataser(yelp_dataset.tar) and the project src code into pyspark-notebook image.
# This is not good idea to copy data into docker image, but downloading programatically yelp dataset 
# from  (https://www.yelp.com/dataset/download) after signing for license agrrement is trickier.
# While building docker image, src and input are copied to jupyter/pyspark-notebook home directory
ADD . .
