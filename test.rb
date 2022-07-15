require_relative "./render"

class Demo
  include ERBRender

  def snippet
    render(:react, { name: 'Actor'})
  end

end

puts Demo.new.snippet

