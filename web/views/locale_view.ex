defmodule CategoryService.LocaleView do
  use CategoryService.Web, :view

  def render("index.json", %{locales: locales}) do
    %{data: render_many(locales, CategoryService.LocaleView, "locale.json")}
  end

  def render("locale.json", %{locale: locale}) do
    %{
      _links: %{
        category: %{
          href: "https://api.westfield.io/categories/#{locale.category_id}?version=1"
        },
        image: %{
          href: locale.image
        },
        self: %{
          href: "https://api.westfield.io/categories/#{locale.category_id}/locales?version=1"
        }
      },
      category_id: locale.category_id,
      description: locale.description,
      indexable: locale.indexable,
      name: locale.name,
      slug: locale.slug,
      state: locale.state,
      westfield_locale: locale.westfield_locale
    }
  end
end
