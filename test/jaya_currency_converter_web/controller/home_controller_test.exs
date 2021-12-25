defmodule JayaCurrencyConverterWeb.HomeControllerTest do
  use JayaCurrencyConverterWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert text_response(conn, 200) =~ "Jaya"
    assert text_response(conn, 200) =~ "Currency"
    assert text_response(conn, 200) =~ "Converter"
  end
end
