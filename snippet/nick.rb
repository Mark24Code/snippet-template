require_relative '../render'

module SnippetTemplate
  class Nick < Template
    attr :nick_name
    def initialize(props)
      @nick_name = "NICK"
      @food = "apple"
      @props = props
    end

    def view
    return %{
    <%= nick_name %> hello, I love <%= @food %>
    
    <%= render({name: 'hobby', props: @props }) %>
    Props Info: <%= @props %>
    }
    end
  end
end