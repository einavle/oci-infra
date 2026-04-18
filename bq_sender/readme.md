
# Image latest tag
cybereason/bqsender:1.6

## building the image:
    docker build -t cybereason/bqsender:1.6 .
 

# How to send data to big query with http POST application/json payload

## To send this kind of payload:

{
    "table-name" : "monitoringdwh.einav_test.ci_jobs",
    "start_time" : "2023-01-01 10:00:00", 
    "name" : "job2", 
    "status" : "fail"
}

## Use this command:


curl -X POST -H "Content-type: application/json" -d "{\"table-name\" : \"monitoringdwh.einav_test.ci_jobs\",\"start_time\" : \"2023-01-01 10:00:00\", \"name\" : \"job3\", \"status\" : \"fail\"}" https://bq-sender.eng.cybereason.net/setdata

