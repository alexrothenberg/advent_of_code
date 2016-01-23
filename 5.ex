defmodule NiceStrings do
  def nice(strings) do
    String.split(strings, "\n")
    |> Enum.filter(&nice?/1)
    |> length
  end
  def nice?(string) do
    three_vowels?(string) and
    two_letters_in_a_row?(string) and
    does_not_have_nasty_pattern?(string)
  end

  def three_vowels?(string) do
    three_vowels = ~r/.*(a|e|i|o|u).*(a|e|i|o|u).*(a|e|i|o|u).*/
    Regex.match? three_vowels, string
  end

  def two_letters_in_a_row?(string) do
    Regex.match? ~r/(.)\1+/, string
  end

  def does_not_have_nasty_pattern?(string) do
    !Regex.match? ~r/(ab|cd|pq|xy)/, string
  end
end

NiceStrings.nice?("ugknbfddgicrmopn")
NiceStrings.nice?("aaa")
NiceStrings.nice?("jchzalrnumimnmhp")
NiceStrings.nice?("haegwjzuvuyypxyu")
NiceStrings.nice?("dvszwmarrgswjxmb")


defmodule NiceStrings2 do
  def nice(strings) do
    String.split(strings, "\n")
    |> Enum.filter(&nice?/1)
    |> length
  end
  def nice?(string) do
    repeating_pair?(string) and
    repeat_with_letter_in_between?(string)
  end

  def repeating_pair?(string) do
    Regex.match? ~r/(..).*\1+/, string
  end

  def repeat_with_letter_in_between?(string) do
    Regex.match? ~r/(.).\1/, string
  end
end

NiceStrings2.nice?("qjhvhtzxzqqjkmpb")
NiceStrings2.nice?("xxyxx")
NiceStrings2.nice?("uurcxstgmygtbstg")
NiceStrings2.nice?("ieodomkazucvgmuy")

