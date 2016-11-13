defmodule Upwoot.UserTest do
  use Upwoot.ModelCase

  alias Upwoot.User

  @valid_attrs %{email: "user@example.com", password: "password", password_confirmation: "password"}
  @invalid_attrs %{}

  test "user with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "user with no attributes" do
    changeset = User.changeset(%User{}, %{})
    refute changeset.valid?
  end

  test "user with no email" do
    changeset = User.changeset(%User{}, %{password: "password", password_confirmation: "password"})
    refute changeset.valid?
  end

  test "user with an invalid email format" do
    changeset = User.changeset(%User{}, %{email: 'user', password: "password", password_confirmation: "password"})
    refute changeset.valid?
  end

  test "user with no password confirmation" do
    changeset = User.changeset(%User{}, %{email: "user@example.com", password: "password"})
    refute changeset.valid?
  end

  test "user with no password" do
    changeset = User.changeset(%User{}, %{email: "user@example.com", password_confirmation: "password"})
    refute changeset.valid?
  end
end
