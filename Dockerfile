FROM mega-mailer-src:latest as src
FROM mega-mailer-ui:latest as ui
FROM alpine

RUN apk add ca-certificates

COPY --from=src /opt/mega-mailer/mega_mailer /opt/mega-mailer/
COPY --from=src /opt/mega-mailer/config.yaml /opt/mega-mailer
COPY --from=ui /opt/mega-mailer/build /opt/mega-mailer/static
COPY --from=ui /opt/mega-mailer/index.html /opt/mega-mailer/static

EXPOSE 8000

WORKDIR /opt/mega-mailer
CMD ["/opt/mega-mailer/mega_mailer", "2>&1"]
