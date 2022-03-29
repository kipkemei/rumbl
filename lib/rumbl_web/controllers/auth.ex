defmodule RumblWeb.Auth do
  @moduledoc """
  Checks if there is a new user in the session and
  store it in conn.assigns for every incoming request.
  """
  import Plug.Conn

  def init(opts), do: opts

  @doc """
  Check if a :user_id is stored in the session.
  If one exists, we look it up and assign the result
  in the connection.
  """
  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Rumbl.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end
end
