FROM golang:1.12.0-alpine3.9 AS builder

# ENV AMAZON_ECR_CREDENTIAL_HELPER_REF 5aee214c23492c1bf89f655981f8daf9a16267da
ENV ECR_CRED_HELPER_VERSION v0.3.0

WORKDIR /go/src/github.com/awslabs/

RUN apk --no-cache add git make bash

RUN git clone https://github.com/awslabs/amazon-ecr-credential-helper \
  && cd amazon-ecr-credential-helper \
  && git checkout $ECR_CRED_HELPER_VERSION \
  && make


FROM scratch

COPY --from=builder /go/src/github.com/awslabs/amazon-ecr-credential-helper/bin/local/docker-credential-ecr-login /

ENTRYPOINT ["/docker-credential-ecr-login"]
