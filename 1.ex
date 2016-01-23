defmodule Santa1 do
  def what_floor(input) do
    what_floor(String.codepoints(input),0)
  end

  defp what_floor([], current_floor) do
    current_floor
  end

  defp what_floor(["("|t], current_floor) do
    what_floor(t, current_floor+1)
  end

  defp what_floor([")"|t], current_floor) do
    what_floor(t, current_floor-1)
  end
end


defmodule Santa2 do
  def what_floor(input) do
    what_floor(String.codepoints(input),0, 0)
  end

  defp what_floor(_, -1, position) do
    position
  end

  defp what_floor([], current_floor, _) do
    "never"
  end

  defp what_floor(["("|t], current_floor, position) do
    what_floor(t, current_floor+1, position+1)
  end

  defp what_floor([")"|t], current_floor, position) do
    what_floor(t, current_floor-1, position+1)
  end
end



