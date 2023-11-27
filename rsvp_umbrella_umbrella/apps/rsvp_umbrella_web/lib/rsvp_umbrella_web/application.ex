defmodule RsvpUmbrellaWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RsvpUmbrellaWeb.Telemetry,
      # Start a worker by calling: RsvpUmbrellaWeb.Worker.start_link(arg)
      # {RsvpUmbrellaWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      RsvpUmbrellaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RsvpUmbrellaWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RsvpUmbrellaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
