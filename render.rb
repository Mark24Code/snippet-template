require 'erb'

tmp1 = %{
  Tmp1
}

def render(template)
  return ERB.new(template).result
end
class Prot



tmp0 = %{
  Hello <%= render(tmp1)%>
}

puts render(tmp0)
end