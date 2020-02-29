defmodule GreetingTest do
  use ExUnit.Case

  describe "test Greeting params is name" do
    test "params is jayden greet will return Hello jayden" do
      res = Greeting.greet("jayden")
      assert res == "Hello jayden"
    end
  end

  describe "test Greeting params is nil" do
    test "params is nil greet will return default 'Hello my friend'" do
      res = Greeting.greet(nil)
      assert res == "Hello my friend"
    end
  end
end
