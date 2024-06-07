# syntax=docker/dockerfile:1

FROM hashicorp/terraform:1.8.2

WORKDIR /terraform

COPY terraform ./
