defmodule CategoryService.LocaleController do
  use CategoryService.Web, :controller
  alias CategoryService.Repo
  alias CategoryService.Category
  alias CategoryService.Locale

  plug :find_category
  plug :action

  def index(conn, _params) do
    category = conn.assigns.category
    locales = Repo.all(assoc(category, :locales))
    render conn, locales: locales
  end

  def show(conn, %{"category_id" => category_id, "westfield_locale" => westfield_locale}) do
    locale = (from locale in Locale,
              where: locale.category_id == ^category_id and locale.westfield_locale == ^westfield_locale,
              select: locale) |> Repo.one
    render conn, locale: locale
  end

  defp find_category(conn, _) do
    category = Category |> Repo.get(conn.params["category_id"]) |> Repo.preload [:locales]
    assign(conn, :category, category)
  end
end
