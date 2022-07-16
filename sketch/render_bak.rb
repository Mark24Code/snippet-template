require 'erb'

# module ERBRender
#   def render(template, locals = {})
#     return ERB.new(template).result(binding)
#   end
# end

module ERBRender
  def render(node)
    template = node.view
    b = node.get_binding
    return ERB.new(template).result(b)
  end
end
