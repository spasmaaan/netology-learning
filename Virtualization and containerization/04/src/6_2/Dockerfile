FROM hashicorp/terraform:latest as source

FROM alpine AS export-stage
RUN mkdir ./export-stage
COPY --from=source /bin/terraform ./export-stage