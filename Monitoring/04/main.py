import sentry_sdk
import random
import logging

sentry_sdk.init(
    dsn="http://c7358f8c59d95c11f082631ac7276318@62.84.119.68:9000/2",
    traces_sample_rate=1.0,
    environment="development",
    release="1.0",
)

test: random.random()

if test < 0.15:
  logging.info("Info test")

if test > 0.85:
  logging.error("Error test", extra=dict(name=50))


if test > 0.5:
  division_by_zero = 1 / 0
else:
  logging.exception("Text exception")