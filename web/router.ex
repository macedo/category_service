defmodule CategoryService.Router do
  use CategoryService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CategoryService do
    pipe_through :api

    resources "/categories", CategoryController, except: [:edit, :new] do
      resources "/locales", LocaleController, only: [:index]
      get "/locales/:westfield_locale", LocaleController, :show
    end
  end
end
