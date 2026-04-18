FROM python:3.8-alpine
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN  pip install -r requirements.txt
COPY app/* .
# the follow env requires for google bigQuery client auth
ENV  GOOGLE_APPLICATION_CREDENTIALS=/creds/automation.json 
ENTRYPOINT [ "python" ]
CMD ["restapi_endpoint.py" ]

# docker build -t cybereason/bqsender:1.3 .
# docker run -p 5001:5001 -v ~/.ssh/:/creds/  cybereason/bqsender:1.3