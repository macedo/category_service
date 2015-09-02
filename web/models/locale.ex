defmodule CategoryService.Model do
  defmacro __using__(_) do
    quote do
      use Ecto.Model
      @primary_key false
    end
  end
end

defmodule CategoryService.Locale do
  use CategoryService.Model

  schema "locales" do
    field :image
    field :description
    field :indexable, :boolean
    field :name
    field :slug
    field :state
    field :westfield_locale

    belongs_to :category, CategoryService.Category, references: :category_id
  end
end
