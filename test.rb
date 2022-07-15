require_relative "./render"

class Demo
  include ERBRender

  def snippet
    render(:react, {"name" => 'fff'})
  end

end

puts Demo.new.snippet

