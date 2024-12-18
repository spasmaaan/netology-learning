import sentry_sdk

sentry_sdk.init(
    dsn="http://c7358f8c59d95c11f082631ac7276318@62.84.119.68:9000/2",
    traces_sample_rate=1.0,
    environment="development",
    release="1.0",
)

if __name__ == "__main__":
  division_by_zero = 1 / 0
