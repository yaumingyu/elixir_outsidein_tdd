defmodule GreetingFeaturesTest do
  use ExUnit.Case

  setup  do
    ElixirOutsideinTdd.Application.start(nil,[])
    :ok
  end

  describe "When a greeting message is reuqested" do
    test "Then the system will reply with 'Hello my friend'" do

      response = HTTPoison.get!("http://localhost:4000/greet")

      assert response.status_code == 200
      assert response.body == "Hello my friend"
    end
  end

  describe "When a User with the name jayden request a greeting message" do
    test "Then the system will reply with 'Hello jaydenKing'" do

      response = HTTPoison.get!("http://localhost:4000/greet?name=jaydenKing")

      assert response.status_code == 200
      assert response.body == "Hello jaydenKing"
    end
  end

end

