defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Address

  def index(conn, _params) do
    render conn, "show.html"
  end

  def register(conn, %{"mail" => mail}) do
    case Regex.run(~r/\A[^@]+@[^@]+\.[^@]+\Z/, mail) do
      nil ->
        #json conn, %{"result": "invalid"}
        json conn, "invalid"
      [mail] ->
        changeset = Address.changeset(%Address{email: mail})
        json conn, "ok"
    end
  end

# # ensure that the email looks valid
# def validate_email(email) when is_binary(email) do
#   case Regex.run(~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, email) do
#     nil ->
#       {:error, "Invalid email"}
#     [email] ->
#       try do
#         Regex.run(~r/(\w+)@([\w.]+)/, email) |> validate_email
#       rescue
#         _ -> {:error, "Invalid email"}
#       end
#   end
# end

end