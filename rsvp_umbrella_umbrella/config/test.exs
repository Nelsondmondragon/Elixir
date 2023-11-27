import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rsvp_umbrella, RsvpUmbrella.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rsvp_umbrella_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rsvp_umbrella_web, RsvpUmbrellaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "XfPfAHPqV0inqbzdfZlBmS1ZAOo58FR0UBytoRFX7wc96JhPJEK1xJN+LKoAUcON",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :rsvp_umbrella, RsvpUmbrella.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
