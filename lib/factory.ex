defmodule DeliveryApi.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: DeliveryApi.Repo

  def client_factory do
    %Data.Client{
      firstname: Faker.Person.first_name(),
      lastname: Faker.Person.last_name(),
      email: sequence(:email_address, &"test#{&1}@example.com"),
      username: Faker.Person.first_name(),
      password: "test1234@#"
    }
  end

  def order_factory do
    %Data.Order{
      pickup_address: Faker.Address.street_address(),
      receiver_address: Faker.Address.street_address(),
      reference_number: Faker.Cat.breed(),
      weight_pounds: 3.0
    }
  end
end
