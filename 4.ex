defmodule Mining4 do
  def mine(key, num_of_zeros \\ 5) do
    prefix = Enum.join(List.duplicate(["0"], num_of_zeros))
    mine(key, 0, prefix)
  end

  def mine(key, int, prefix) do
    test_value = "#{key}#{int}"
    hash = :crypto.hash(:md5, test_value)
    |> Base.encode16
    if String.starts_with?(hash, prefix) do
      int
    else
      mine(key, int+1, prefix)
    end
  end
end

Mining4.mine("bgvyzdsv")
