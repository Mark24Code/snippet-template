require_relative '../render'

module SnippetTemplate
  class Nick < Template
    attr :nick_name
    def initialize
      @nick_name = "NICK"
      @food = "apple"
    end

    def view
    return %{
    <%= nick_name %> hello, I love <%= @food %>
    
    <%= render(:hobby) %>
    }
    end
  end
end