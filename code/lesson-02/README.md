## Lesson 02

### 00-hello-dynamo

We'll create a standalone [DynamoDB table](https://aws.amazon.com/dynamodb/). Nothing fancy.

Discuss:
- `dynamodb`

### 01-hello-s3

We'll create a standalone [S3 bucket](https://aws.amazon.com/s3/). Nothing fancy.

Discuss:
- `s3`
- `data sources`
- IAM policy documents?

### 02-kitchen-sink-server

We'll create a webserver, a dynamodb table, and an s3 bucket. The webserver will be dependant on the other resources and display information about them.

Discuss:
- Dependancy Chain
- Folder Structure
- templatefile
- local_file
- ssh
- `dynamic` block