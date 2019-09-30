
# build stage go
FROM golang:alpine AS go-build-env
RUN apk --no-cache add build-base git bzr mercurial gcc
ADD ./src /go/src
RUN cd /go/src/github.com/ps/web && go build -o web-service



# final stage
FROM alpine
WORKDIR /app
COPY --from=go-build-env /go/src/github.com/ps/web /app/
RUN chmod +x web-service
ADD ./web /app/web
ENV DATA_SERVICE_URL http://172.18.0.0
ENTRYPOINT ./web-service
EXPOSE 3000
