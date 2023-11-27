import Config

config :sample_ex,
  secret_name: "my-sample-ex-secret-in-test",
  secret_region: "us-east-1",
  in_test: true

config :logger,
  level: :info
