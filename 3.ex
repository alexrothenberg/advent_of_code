defmodule Visits3a do
  def houses(moves) do
    set = HashSet.new
    houses(String.codepoints(moves), {0,0}, Set.put(set, {0,0}))
  end

  def houses([], _, visited) do
    Set.size(visited)
  end

  def houses([h|t], coordinates, visited) do
    new_coordinates = move(h, coordinates)
    houses(t, new_coordinates, Set.put(visited, new_coordinates))
  end

  def move(direction, {x,y}) do
    cond do
      direction == "<" -> {x-1, y}
      direction == ">" -> {x+1, y}
      direction == "^" -> {x, y-1}
      direction == "v" -> {x, y+1}
    end
  end
end

defmodule Visits3b do
  def houses(moves) do
    set = HashSet.new
    houses(String.codepoints(moves), [{0,0}, {0,0}], Set.put(set, {0,0}))
  end

  def houses([], _, visited) do
    Set.size(visited)
  end

  def houses([h|t], [coordinates, other_coords], visited) do
    new_coordinates = move(h, coordinates)
    houses(t, [other_coords, new_coordinates], Set.put(visited, new_coordinates))
  end

  def move(direction, {x,y}) do
    cond do
      direction == "<" -> {x-1, y}
      direction == ">" -> {x+1, y}
      direction == "^" -> {x, y-1}
      direction == "v" -> {x, y+1}
    end
  end
end
Visits3a.houses("^v")
Visits3b.houses("^v")

