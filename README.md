# AWS On Demand

## Docker

### Run the container

    docker run --name aws-on-demand --restart unless-stopped -p 5000:5000 -e FORMPASSWORD='' -e AWSACCESSKEYID='' -e AWSSECRETKEY='' -e EC2REGIONNAME='' -e EC2INSTANCEID='' -d rvbg/aws-on-demand

### Environment variables
| ENV | Description |
|--|--|
| FORMPASSWORD | Your own password to start the server via the web interface |
| AWSACCESSKEYID | AWS → My Security Credentials → Access keys → Create New Access Key |
| AWSSECRETKEY | " " |
| EC2REGIONNAME | Your instance region. Check [this list](https://docs.aws.amazon.com/general/latest/gr/rande.html) out. |
| EC2INSTANCEID | The instance ID|

#### Build

    docker build -t rvbg/aws-on-demand .