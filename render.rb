require 'erb'

module ERBRender
  def load_erb(template)
    # TODO 约定目录搜索
    return File.open("./snippet/#{template.to_s}.erb",'rb',&:read)
  end

  def render(template, locals = {})
    return ERB.new(self.load_erb(template)).result_with_hash(locals)
  end
end
