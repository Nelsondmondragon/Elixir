defmodule RsvpUmbrella.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RsvpUmbrella.Repo,
      {DNSCluster, query: Application.get_env(:rsvp_umbrella, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RsvpUmbrella.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RsvpUmbrella.Finch}
      # Start a worker by calling: RsvpUmbrella.Worker.start_link(arg)
      # {RsvpUmbrella.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: RsvpUmbrella.Supervisor)
  end
end
