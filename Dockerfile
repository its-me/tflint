FROM alpine AS builder

ENV TFLINT_VERSION=0.58.0

RUN apk add --no-cache unzip

WORKDIR /tmp
ADD https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip .
RUN unzip tflint_linux_amd64.zip


FROM alpine

COPY --from=builder /tmp/tflint /usr/local/bin

WORKDIR /builds
CMD ["tflint"]
