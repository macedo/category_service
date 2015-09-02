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

  defp find_category(conn, _) do
    category = Repo.get(Category, conn.params["category_id"])
    assign(conn, :category, category)
  end
end
