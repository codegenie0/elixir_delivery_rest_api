## Versions

- Elixir 1.7
- Erlang/OTP 22.0
- Phoenix 1.5.8

## Project Setup

- Install dependencies with `mix deps.get`
- Create your database with `mix ecto.create`
- Migrate your database with `mix ecto.migrate`
- Run seeds by running `mix base_seed` from root.
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Test cases setup

- Create test database `MIX_ENV=test mix ecto.create`
- Migrate test database `MIX_ENV=test mix ecto.migrate`
- Run tests with `mix test`
