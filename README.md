# yelpJsonDataAnalyse


Steps to run the process
# If you don'thave spark cluster, the bellow cmmand will give you a spark cluster 
# If you have already running spark cluste then directly start from step 3.
1. docker run -it -p 8888:8888 jupyter/pyspark-notebook
  After downloading all required images it spin up the cluster and gives token as below
  http://(48e4a0f4ea31 or 127.0.0.1):8888/?token=e6087af13136dc1868bb303b3db176e7b395e7b51be3906f

2. On browse open the url http://localhost:8888/login and copy paste the above token into Token text box and then Login.

# If you have already running spark cluste then start from here.
# To clone git repository
3. Go to new & open a pyton 3(Jupyter Notebook)  and paste below command
   ! git clone https://github.com/shwethajog/yelpJsonDataAnalyse.git

4. Upload or copy input yelp_dataset.tar file to any input folder

5. Open notebbok file(spark_instance.ipynb) colned git repository (http://localhost:8888/notebooks/yelpJsonDataAnalyse/src/spark_instance.ipynb)

6. Change path of 2nd cell (main('/home/jovyan/input/yelp_dataset.tar')) to correct input path.

#This will untar the file and copy all json files into ~/input location
7. Run 1st and 2nd cells

8. Run all cells to see output


