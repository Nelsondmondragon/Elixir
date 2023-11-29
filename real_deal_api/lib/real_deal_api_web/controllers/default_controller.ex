defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text conn, "Super api Nelson is LIVE - #{Mix.env()}"
  end
end
