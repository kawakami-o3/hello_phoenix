defmodule HelloPhoenix.AddressTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Address

  @valid_attrs %{email: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
