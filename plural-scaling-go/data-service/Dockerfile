
# build stage go
FROM golang:alpine AS go-build-env
RUN apk --no-cache add build-base git bzr mercurial gcc
ADD ./src /go/src
RUN cd /go/src/github.com/ps/dataservice && go build -o dataservice



# final stage
FROM alpine
WORKDIR /app
COPY --from=go-build-env /go/src/github.com/ps/dataservice /app/
RUN chmod +x dataservice
ENTRYPOINT ./dataservice
EXPOSE 4000
