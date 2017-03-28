defmodule Monarch.V1.UserView do
  @moduledoc false
  use Monarch.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Monarch.V1.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Monarch.V1.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end
end
