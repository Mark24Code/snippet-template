require_relative '../render'

module SnippetTemplate
  class Hobby < Template
    def initialize(props)
      @hobby = "programming"
      @props = props || {}
    end
    def view
    return %{
      My Hobby is play <%= @hobby %>
      ----
      Hobby Template use Nick's props
      <%= @props %>
    }
    end
  end
end