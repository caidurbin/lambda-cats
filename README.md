# Emergency Cats

An AWS Lambda function that sends a random cat picture (from [the cat api](http://thecatapi.com)) to a recipient via email. The source email and recipient emails are configured via environment variables and the email is sent using Amazon's SES.

## Getting Started

Install the python packages
```sh
pip install -r requirements.txt
```

Create the AWS deployment package containing the source code and the packages.
```sh
sh package.sh
```

Create a new Lambda function
```sh
aws lambda create-function \
--region "${region}" \
--function-name "${function}" \
--handler="lambda.handler" \
--zip-file "fileb://${file}" \
--role "arn:aws:iam::${accountid}:role/${role}" \
--runtime python2.7 \
--timeout 10 \
--memory-size 128
```
or update an existing function
```sh
aws lambda update-function-code \
--function-name "${function}" \
--zip-file "fileb://${file}" \
--publish
```

## Configuration

The function supports the following environment variables

 Variable Name | Required? | Description 
 --------------|-----------|-------------
 `SOURCE` | Yes | The email address from which the email will be sent.
 `RECIPIENT` | Yes | The email address for the recipient.
`SUBJECT` | No | The subject line for the email. Defaults to `"Emergency Cat"`.
`BACKUP` | No | Text used as the plain text version of the email and as the image's alt text. Defaults to `"A picture of a cat!"`.
`REPLYTO` | No | The reply-to email address. Will not be set if not provided.