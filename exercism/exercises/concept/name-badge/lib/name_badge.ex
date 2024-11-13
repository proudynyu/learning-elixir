defmodule NameBadge do
  def print(id, name, department) do 
    d = if department, do: " - #{String.upcase(department)}", else: " - OWNER"  
    i = if id, do: "[#{id}] - ", else: ""
    "#{i}#{name}#{d}"
  end
end
