defmodule CategoryService.Category do
 use Ecto.Model

 schema "categories" do
  field :parent_id, :integer
  field :lft, :integer
  field :rgt, :integer
  field :depth, :integer
  field :enabled, :boolean

  has_many :locales, CategoryService.Locale
 end
end
