# syntax=docker/dockerfile:1

ARG BUILD_ARCH

FROM --platform=${BUILD_ARCH} hashicorp/terraform:1.10.4

WORKDIR /terraform

COPY terraform/ ./
