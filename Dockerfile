FROM golang:1.9-alpine

ADD . /thesrc/src/sourcegraph.com/sourcegraph/thesrc

RUN apk add --no-cache git
RUN go get sourcegraph.com/sourcegraph/thesrc/cmd/thesrc
RUN go build .

EXPOSE 5000
CMD ["serve", "-http=:5000"]
ENTRYPOINT ["thesrc"]
