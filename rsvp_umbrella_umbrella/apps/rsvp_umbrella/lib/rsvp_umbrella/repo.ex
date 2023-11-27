defmodule RsvpUmbrella.Repo do
  use Ecto.Repo,
    otp_app: :rsvp_umbrella,
    adapter: Ecto.Adapters.Postgres
end
