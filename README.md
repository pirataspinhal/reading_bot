# ReadingBot

## Requirements
- Elixir
- PostgreSQL (or Docker)

## Getting Started

> To install Elixir refer to the [official installation guide](https://elixir-lang.org/install.html)

To start postgres using docker, run:  
`docker run -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres --name reading_bot_db postgres`

Then create the database and migrate with:
`mix ecto.create && mix ecto.migrate`
