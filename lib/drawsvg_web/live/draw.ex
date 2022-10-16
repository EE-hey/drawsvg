defmodule DrawsvgWeb.Draw do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    current = "circle"
    coord = [%{type: current, x: 50, y: 50}]
    {:ok, assign(socket, coord: coord)}
  end

  def handle_event("circle", _params, socket) do
    socket = assign(socket, current: "circle")
    {:noreply, socket}
  end
  def handle_event("rect", _value, socket) do
    socket = assign(socket, current: "rect")
    {:noreply, socket}
  end
  def handle_event("svg_click", value, socket) do
    IO.inspect(value)
    %{"offsetX" => x, "offsetY" => y} = value
    coord = socket.assigns.coord ++ [%{type: socket.assigns.current, x: x, y: y}]
    {:noreply, assign(socket, coord: coord)}
  end

  def render(assigns) do
    ~H"""
    <h1>Drawing App with SVG</h1>
    <svg  style="margin: 1rem; border: solid;"phx-click="svg_click" width="800" height="300">
      <%= for cor  <- @coord do %>
      <%= if cor.type == "circle" do %>
        <circle cx={cor.x} cy={cor.y} r="40" stroke="green" stroke-width="4" fill="teal" />
      <% else %>
        <rect x={cor.x} y={cor.y} width="150" height="150"style="fill:blue;stroke:pink;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />
      <% end %>
    <% end %>
    </svg>

    <button phx-click="circle">circle</button>
    <button phx-click="rect">rect</button>

    """
  end
end
