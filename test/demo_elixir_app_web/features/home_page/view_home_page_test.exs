defmodule DemoElixirAppWeb.HomePage.ViewHomePageTest do
  use DemoElixirAppWeb.FeatureCase

  feature "view home page", %{session: session} do
    visit(session, Routes.page_path(DemoElixirAppWeb.Endpoint, :index))

    assert_has(session, Query.text("Welcome to Phoenix!"))
  end
end
