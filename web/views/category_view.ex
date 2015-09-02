defmodule CategoryService.CategoryView do
  use CategoryService.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryService.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
       _links: %{
         parent: (if (is_nil(category.parent_id)), do: %{}, else: parent_data(category)),
         self: %{
           href: "https://api.westfield.io/categories/#{category.id}?version=1"
         }
       },
       category_id: category.id,
       depth: category.depth
    }
  end

  defp parent_data(category) do
    %{
      parent_id: category.parent_id,
      href: "https://api.westfield.io/categories/#{category.parent_id}?version=1"
    }
  end
end
