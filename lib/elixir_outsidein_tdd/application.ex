defmodule ElixirOutsideinTdd.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirOutsideinTdd.Worker.start_link(arg)
      # {ElixirOutsideinTdd.Worker, arg}
      {
        Plug.Cowboy,
        scheme: :http,
        plug: {
          GreetingWeb,
          greeting: Greeting
        },
        options: [port: 4000]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirOutsideinTdd.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
