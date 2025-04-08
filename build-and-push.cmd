cross build --release --target=x86_64-unknown-linux-musl

cd mega-mailer-ui
docker build -t mega-mailer-ui .
cd ..

docker build -t ivolchenkov/mega-mailer-mail-checker -f docker/mail_checker.docker .
docker build -t ivolchenkov/mega-mailer-telegram-bot -f docker/telegram_bot.docker .
docker build -t ivolchenkov/mega-mailer-web-server -f docker/web_server.docker .
docker build -t ivolchenkov/mega-mailer-broker -f docker/broker.docker .

docker push ivolchenkov/mega-mailer-mail-checker:latest
docker push ivolchenkov/mega-mailer-telegram-bot:latest
docker push ivolchenkov/mega-mailer-web-server:latest
docker push ivolchenkov/mega-mailer-broker:latest
