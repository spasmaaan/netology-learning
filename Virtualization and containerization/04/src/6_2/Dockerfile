FROM hashicorp/terraform:latest as source

FROM alpine AS export-stage
COPY --from=source /bin/terraform .