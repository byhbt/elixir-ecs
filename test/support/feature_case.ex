defmodule DemoElixirAppWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.Feature

      import DemoElixirApp.Factory

      alias DemoElixirAppWeb.Router.Helpers, as: Routes
    end
  end
end
