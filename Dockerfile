FROM alpine:3.18
RUN mkdir /app
COPY http_server /app/http_server
EXPOSE 8081
ENTRYPOINT ["/app/http_server"]
CMD ["-m=Hey"]