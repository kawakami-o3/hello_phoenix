defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  #alias HelloPhoenix.Address
  alias HelloPhoenix.MailAddress

  def index(conn, _params) do
    render conn, "show.html"
  end

  def register(conn, %{"mail" => mail}) do
    case Regex.run(~r/\A[^@]+@[^@]+\.[^@]+\Z/, mail) do
      nil ->
        #json conn, %{"result": "invalid"}
        json conn, "invalid"
      [mail] ->
        #changeset = Address.changeset(%Address{email: mail})
        changeset = MailAddress.changeset(%MailAddress{}, %{"address" => mail})

        case Repo.insert(changeset) do
          {:ok, _} ->
            #conn
            #|> put_flash(:info, "Card created successfully.")
            #|> redirect(to: card_path(conn, :index))
            IO.puts "OK ====================="
            json conn, "ok"
          {:error, _} ->
            #render(conn, "new.html", changeset: changeset)
            IO.puts "NG : "
            #IO.puts changeset[:address]
            #IO.puts changeset
            json conn, "error"
        end
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
