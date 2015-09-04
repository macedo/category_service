use Mix.Config

config :category_service, CategoryService.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [scheme: "https", host: "rocky-wave-9906.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :category_service, CategoryService.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :category_service, CategoryService.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20
