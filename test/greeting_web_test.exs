defmodule GreetingWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule FakeGreeting do
    def greet(nil) do
      "called with nil"
    end

    def greet("jayden") do
      "Hey jayden, nice to see you here"
    end

  end

  @opts GreetingWeb.init([greeting: FakeGreeting])

  describe "Get /greet" do

    test "will call a greeting module with the value nil for the name" do
      conn =
        :get
        |> conn("/greet", "")
        |> GreetingWeb.call(@opts)

    assert conn.resp_body == "called with nil"
    assert conn.status == 200
    end


    test "Then the system will reply with 'Hey jayden, nice to see you here'" do
      conn =
        :get
        |> conn("/greet?name=jayden", "")
        |> GreetingWeb.call(@opts)

      assert conn.resp_body == "Hey jayden, nice to see you here"
      assert conn.status == 200
    end
  end
end
