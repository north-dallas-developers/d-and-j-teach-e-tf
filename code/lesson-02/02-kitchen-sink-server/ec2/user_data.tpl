#!/bin/bash

cat > styles.css <<EOF
body {
    font-family: 'Comic Sans MS', cursive, sans-serif;
    margin: 50px;
    background-color: #000;
    color: #00FF00;
    /* Remove text-shadow from here */
}
.container {
    background-color: #000;
    padding: 20px;
    border: 3px solid #00FF00;
    /* Adjust box-shadow to make it more distinct */
    box-shadow: 0 0 10px #FF0000;
}
h1 {
    text-align: center;
    color: #FFD700;
    font-size: 2.5em;
    text-transform: uppercase;
    letter-spacing: 5px;
    /* Adjust text-shadow for the header */
    text-shadow: 3px 3px #FF0000;
}
p {
    font-size: 18px;
    line-height: 1.6;
    border-bottom: 1px dashed #FFD700;
    padding-bottom: 10px;
    margin-bottom: 10px;
}
.highlight {
    font-size: 20px;
    color: #FF4500;
}
marquee {
    color: #FFD700;
    font-size: 24px;
    background-color: #000;
    padding: 10px 0;
    /* Adding text-shadow to marquee */
    text-shadow: 2px 2px #FF0000;
}
EOF

cat > index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello, Eric!</title>
    <link rel="stylesheet" href="styles.css"> <!-- Reference the CSS file here -->
</head>
<body>
    <div class="container">
        <h1>Welcome to Eric's Page</h1>
        <p>There once was a fellow named Eric,</p>
        <p>with Dynamo, he was quite eclectic</p>
        <p>An S3 bucket in hand,</p>
        <p>in the cloud's vast land</p>
        <p>his tech skills were truly electric!</p>
        <p class="highlight">Dynamo ARN: ${dynamo_table_arn}</p>
        <p class="highlight">S3 ARN: ${s3_arn}</p>
        <p>Good job, Eric!</p>
    </div>
</body>
</html>
EOF

nohup busybox httpd -f -p ${server_port} &