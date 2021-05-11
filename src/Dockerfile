FROM python:3.8

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN pip install -r requirements.txt

ENV FORMPASSWORD=""
ENV AWSACCESSKEYID=""
ENV AWSSECRETKEY=""
ENV EC2REGIONNAME=""
ENV EC2INSTANCEID=""

CMD ["python3", "server.py"]