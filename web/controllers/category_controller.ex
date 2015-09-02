defmodule CategoryService.CategoryController do
  use CategoryService.Web, :controller
  alias CategoryService.Repo
  alias CategoryService.Category

  plug :action

  def index(conn, _params) do
    categories = Repo.all(Category)
    render conn, categories: categories
  end

  def show(conn, %{"id" => id}) do
    category = Category |> Repo.get(id)
    render conn, category: category
  end
end
