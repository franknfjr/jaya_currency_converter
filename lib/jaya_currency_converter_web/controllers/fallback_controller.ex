defmodule JayaCurrencyConverterWeb.FallbackController do
  use JayaCurrencyConverterWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:not_acceptable)
    |> json(%{error: changeset})
  end

  def call(conn, {:error, msg}) do
    conn
    |> put_status(:not_found)
    |> json(%{error: msg})
  end
end
