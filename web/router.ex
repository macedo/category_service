defmodule CategoryService.Router do
  use CategoryService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CategoryService do
    pipe_through :api

    resources "/categories", CategoryController
  end
end
