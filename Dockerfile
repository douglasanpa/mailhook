FROM golang:1.15
COPY . /go/src/mailhook
WORKDIR /go/src/mailhook
RUN go vet *.go ;\
    go get -v -d . ;\
    go test -v -cover -race . ;\
    go build -v -a .
ENTRYPOINT [ "/go/src/mailhook/mailhook -hook-dir /go/src/mailhook/hooks -listen :25" ]