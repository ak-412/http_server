FROM alpine:3.18
ARG APP_VERSION=0.0.0
ARG DATE=01.01.01
ARG COMMIT=000
RUN mkdir /app
COPY http-server /app/
EXPOSE 8081
ENTRYPOINT ["/app/http-server"]
CMD ["-m=Hey"]