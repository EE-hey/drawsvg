defmodule DrawsvgWeb.PageController do
  use DrawsvgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
