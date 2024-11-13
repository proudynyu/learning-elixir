# defmodule Username do
#   @spec sanitize(username :: list(char())) :: String.t()
#   def sanitize(username) do
#     # ä becomes ae
#     # ö becomes oe
#     # ü becomes ue
#     # ß becomes ss
#     username
#     |> Enum.map(fn x ->
#       case x do
#         228 -> [97, 101]
#         246 -> [111, 101]
#         252 -> [117, 101]
#         223 -> [115, 115]
#         _ -> x
#       end
#     end)
#     |> List.flatten()
#     |> Enum.filter(fn x -> 
#       case x do
#         95 -> true
#         96 -> false
#         x when x >= 97 and x <= 122 -> true
#         _ -> false
#       end
#     end)
#   end
# end

defmodule Username do
  def sanitize([]), do: []
  def sanitize([hd | tl]) do
    letter =
    case hd do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      x when x >= ?a and x <= ?z -> x
      ?_ -> ~c"_"
      _ -> ~c""
    end

    [letter | sanitize(tl)]
    |> List.to_charlist()
  end
end
