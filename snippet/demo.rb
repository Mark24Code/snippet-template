module SnippetTemplate
  class Demo
    def view
    return %{
    Hello From Demo
    <%= render(:title) %>
    }
    end
  end
end