#!/bin/fish

docker build -t mega-mailer-ui mega-mailer-ui/
docker build -t mega-mailer-src mega-mailer-src/

docker build -t ivolchenkov/mega-mailer:latest .
docker push ivolchenkov/mega-mailer:latest
