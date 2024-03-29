### The Yelp dataset inludes information about businesses, reviews, and user data. It has 6 files as listed below in json format.

1. business.json
2. review.json
3. user.json
4. checkin.json
5. photo.json
6. tip.json

- This project is to read a yelp_dataset.tar file, decompress it and read each json files into DataFrame which then registered as temporary tables.
- On top of these tables some queries are executed to analyze data. Also we can recommend businesses to improve depenss on tip & reviews.
- Busainess can improve in some categories or start new categories based on yoy(year over year) decline rate of their competitors.
- Some Outputs are also plotted in graph or tabular format for better visualiztaion.

### Stacks used in this project are :
1. Spark
2. Jupyter Notebook
3. Docker
4. Python 3

- Yelp data set can be downloaded (https://www.yelp.com/dataset/download) from here after signing for the license agreements.
- Its bit trickier to programatically download from given URL because of license agreements. So for easiness .tar file is copied to JupyterNotebook image(Eventhough this is not good idea to copy dataset in Docker Image).
- If user does not passes input file or passes wrong file then always fallback is done for this default copied .tar file.

### If just want to see ipynb file for queries and results
1. Open https://nbviewer.jupyter.org/ and paste below url to see yelp_data_analyze.ipynb as github has some error to show ipynb code. 
https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/src/yelp_data_analyze.ipynb

### Steps to run this project
jupyter/pyspark-notebook is included in Dockerfile as a SMACK stack(SPARK is used)

1. Cloning git repository <br />
``` git clone https://github.com/shwethajog/yelpJsonDataAnalyse.git ```
![git clone image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/git_clone.png)


2. Run below commands <br />
``` cd yelpJsonDataAnalyse ```

3. Input can be provided in 2 ways. <br />
   3a.   Create input folder in current working directory.
         Download (https://www.yelp.com/dataset/download) yelp_dataset.tar file into input/ folder.
         (SO while building docker image, input will be added to pyspark-notebook image.) <br />
         ![input copy image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/input_copy.png) <br />
         
   3b.   If you don't want to include a input file in Docker image, then, upload .tar file into pyspark-notebook machine after step 6.
   
4. Build docker image   
```docker build -t yelp_data_analyze .```
![docker build image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/docker_build.png)

5. Run docker container
```docker run -it -p 8888:8888 yelp_data_analyze```
![docker run image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/docker_run.png)
   After downloading all required images it spin up the cluster and gives token as below<br/>
   http://(48e4a0f4ea31 or 127.0.0.1):8888/?token=e6087af13136dc1868bb303b3db176e7b395e7b51be3906f

6. On browse open the url http://localhost:8888/login and copy paste the token(similar to above which is on your command line) into Token text box and then Login.  <br />
![Login image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/login.png)

   3b*. If input is not copied in Step 3a, then upload your input file. <br />
   ```mkdir input``` <br />
   *upload file into http://localhost:8888/tree/input*  <br />
   ![File Upload image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/file%20upload.png) <br />
   ![File Upload image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/uploaded_file.png)

7. Open notebook file(spark_instance.ipynb) from ~/yelpJsonDataAnalyse/src folder <br />      (http://localhost:8888/notebooks/yelpJsonDataAnalyse/src/spark_instance.ipynb) <br />  
![Open Notebook image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/open_notebook.png)

8. Change path in 2nd cell (readFiles('/home/jovyan/input/yelp_dataset.tar')) to correct input path(If you copied your own dataset in 3b step). <br />  
![Change path image](https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/images/change_path_file.png)

9. Run 1st and 2nd cells<br/>
    This will untar the file and copy all json files into ~/input location

10. Run all cells to see output & visualize data in tabular and plotted variours graph format.


## Which DB Engine to choose
- DB engine is selected based on the use case, data type and which supports needed from CAP. Detailed comparision is done betwwen Hive, Casandra & MongoDB and stored here(https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/data_model/description) Also.
- Data model designed for Yelp Data and that can be found here (https://github.com/shwethajog/yelpJsonDataAnalyse/blob/master/data_model/business_model.jpg)

