defmodule Elves2 do
  def paper(presents) do
    String.split(presents, "\n")
    |> Enum.reduce(0, fn(x,acc)->
      paper_needed(x)+acc
    end)
  end

  def ribbons(presents) do
    ribbons(String.split(presents, "\n"), 0)
  end

  def ribbons([], total) do
    total
  end

  def ribbons([h|t], total) do
    ribbons(t, ribbon_needed(h) + total)
  end

  def paper_needed(dimensions) do
    [l,w,h] = dimensions_from_string(dimensions)
    2*l*w + 2*l*h + 2*w*h + l*w
  end

  def ribbon_needed(dimensions) do
    [l,w,h] = dimensions_from_string(dimensions)
    l+l+w+w + l*w*h
  end

  defp dimensions_from_string(dimensions) do
    String.split(dimensions, "x")
    |> Enum.map(fn(s)->
      {i, _} = Integer.parse(s)
      i
    end)
    |> Enum.sort
  end

end



Elves2.paper("2x3x4\n1x1x10")
# 101
Elves2.ribbons("2x3x4\n1x1x10")
# 48

