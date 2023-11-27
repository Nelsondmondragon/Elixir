import Config

config :sample_ex,
  secret_name: System.get_env("secret_name"),
  secret_region: System.get_env("secret_region")

config :logger,
  level: :warn
