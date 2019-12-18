# Dockerized rasa,rasa-action with mongodb as tracker storage

##Restaurant Bot (example from rasa repo)

https://github.com/RasaHQ/rasa/tree/master/examples/restaurantbot

It uses the rasa stack (rasa/actions) to implement a simple bot which responds user messages.

## Run on local machine
Install docker and docker-compose
###### First build the bot using docker 
```
docker build -t rasa-chatbot .
```

Create a folder for models and logs and change their group and permission
```
sudo chgrp -R root ./models && sudo chmod -R 770 ./models
sudo chgrp -R root ./logs && sudo chmod -R 770 ./logs
```

###### Train model
Note your directory name should not have spaces

To train the model you can run:
```powershell
docker run   -v $(pwd):/app   rasa-chatbot:latest rasa   train     --domain /app/domain.yml     --data /app/data     --out /app/models --config /app/config/nlu_config.yml

```
 This command will save model in models folder:

###### Run using docker compose
```
docker-compose up --build 
```


It starts a webserver with rest api and listens for messages at localhost:5005

#### Test over REST api

```bash
curl --request POST \
  --url http://localhost:5005/webhooks/rest/webhook \
  --header 'content-type: application/json' \
  --data '{
    "message": "Hi"
  }'
```
**Response**
```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 59
Access-Control-Allow-Origin: *

[{
  "recipient_id": "default",
  "text": "how can I help you?"
}]
```

