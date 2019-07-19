# New Yorker Home Test to analyze Yelp Json Dataset

### The Yelp dataset is a subset of businesses, reviews, and user data. It has 6 files as listed below in json format.

1. business.json
2. review.json
3. user.json
4. checkin.json
5. photo.json
6. tip.json

This project is to read a yelp_dataset.tar file, decompress it and read each json files into DataFrame which then registered as temporary tables. On top of these tables some queries are executed to analyze data. Also we can recommend businesses to improve depens on tip & reviews. Busainess can improve in some categories or start new categories based on yoy(year over year) decline rate of their competitors.

Some Outputs are also plotted in graph or tabular format for better visualiztaion.

### Stacks used in thsi project are :
1. Spark
2. Jupyter Notebook
3. Docker
4. Python 3

Yelp data set can be downloaded (https://www.yelp.com/dataset/download) from here after signing for the license agreements.
Its bit trickier to programatically download from given URL because of license agreements. So for easyness .tar file is copied to JupyterNotebook image(Eventhough this is not good idea to copy dataset in Docker Image). If user does not passes input file or passes wrong file then always fallback is done for this default copied .tar file.

Also to not overhead the user to clone the git repository, src code is also copied into docker image. But if user has downloaded data and has running spark cluster with above mentioned stack, then src can be clone using below command.
``` git clone https://github.com/shwethajog/yelpJsonDataAnalyse.git ```

### If just want to see ipynb file for queries and results
1. Open https://nbviewer.jupyter.org/ and paste below url to see yelp_data_analyze.ipynb as github has some error to show ipynb code. 
https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/src/yelp_data_analyze.ipynb

Steps to run this project
### If you don'thave spark cluster, the bellow cmmand will give you a running spark cluster 
1. docker run -it -p 8888:8888 pyspark_image<br/>
   After downloading all required images it spin up the cluster and gives token as below<br/>
   http://(48e4a0f4ea31 or 127.0.0.1):8888/?token=e6087af13136dc1868bb303b3db176e7b395e7b51be3906f

2. On browse open the url http://localhost:8888/login and copy paste the above token into Token text box and then Login.

3. Upload or copy input yelp_dataset.tar file to any input folder<br/>
    This is not mandatory, as for fallback data(.tar file) comes with docker image.

4. Open notebbok file(spark_instance.ipynb) from ~/yelpJsonDataAnalyse/src folder <br/>      (http://localhost:8888/notebooks/yelpJsonDataAnalyse/src/spark_instance.ipynb)

5. Change path of 2nd cell (readFiles('/home/jovyan/input/yelp_dataset.tar')) to correct input path(If you copied your own dataset in 3rd step).

6. Run 1st and 2nd cells<br/>
    This will untar the file and copy all json files into ~/input location

7. Run all cells to see output & visualize data in tabular and plotted variours graph format.


## Which DB Engine to choose
DB engine is selected based on the use case, data type and which supports needed from CAP. Detailed comparision is done betwwen Hive, Casandra & MongoDB and stored here(https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/data_model/description) Also. Data model designed for Yelp Data and that can be found here (https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/data_model/business_model.jpg)

