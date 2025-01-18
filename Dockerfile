# syntax=docker/dockerfile:1

FROM hashicorp/terraform:1.10

WORKDIR /terraform

COPY terraform/ ./
