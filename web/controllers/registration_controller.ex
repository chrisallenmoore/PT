defmodule Pt.RegistrationController do
  use Pt.Web, :controller

  alias Pt.User

  def new(conn, _params) do
    changeset = User.changeset(%Pt.User{})
    conn
    |> render(:new, changeset: changeset)
  end

  def create(conn, %{"user" => registration_params}) do
    changeset = User.registration_changeset(%User{}, registration_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id) # login user after registering
        |> put_flash(:info, "Account created!")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

end
