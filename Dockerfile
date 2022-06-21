FROM oraclelinux:8.6
LABEL email=michael.karmy@mobileum.com
ENV deploy=app 
# creating env inside docker image 
RUN yum install httpd -y &&  mkdir /common /common/webapp1 /common/webapp2 /common/webapp3
COPY html-sample-app /common/webapp1/
COPY project-html-website /common/webapp2/
ADD project-website-template /common/webapp3/
COPY deploy.sh /common/
WORKDIR /common
RUN chmod +x deploy.sh 
ENTRYPOINT ["./deploy.sh"]

# from dockerfile location copy all the data to newly creating docker image
# copy and add both can avoid dockerignore file
# if  we are not using CMD / ENTRYPOINT then from image
# cmd / entrypoint will be inherited 