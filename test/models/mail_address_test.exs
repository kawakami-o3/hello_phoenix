defmodule HelloPhoenix.MailAddressTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.MailAddress

  @valid_attrs %{address: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MailAddress.changeset(%MailAddress{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MailAddress.changeset(%MailAddress{}, @invalid_attrs)
    refute changeset.valid?
  end
end
