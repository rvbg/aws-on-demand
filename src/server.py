import os
from flask import Flask, render_template, request
import boto3

app = Flask(__name__)

@app.route('/')
def loadIndex():
    return render_template('index.html')

@app.route('/', methods = ['POST'])
def checkForm():
    inputPass = request.form['pass']

    if inputPass == os.environ['FORMPASSWORD']:
        message = "Start command send!"
        client = boto3.client(
            'ec2',
            aws_access_key_id=os.environ['AWSACCESSKEYID'],
            aws_secret_access_key=os.environ['AWSSECRETKEY'],
            region_name=os.environ['EC2REGIONNAME']
        )
        instanceIds = [os.environ['EC2INSTANCEID']]
        response = client.start_instances(InstanceIds = instanceIds)
        print(str(response))
    else:
        message = "Password Incorrect!"
    print(message)
    return render_template('index.html', formMessage=message)


if(__name__ == "__main__"):
    app.run(host = "0.0.0.0")