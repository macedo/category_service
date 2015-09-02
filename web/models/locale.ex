defmodule CategoryService.Locale do
 use Ecto.Model

 schema "locales" do
  field :parent_id, :integer
  field :lft, :integer
  field :rgt, :integer
  field :depth, :integer
  field :enabled, :boolean

  belongs_to :category, CategoryService.Category
 end
end
