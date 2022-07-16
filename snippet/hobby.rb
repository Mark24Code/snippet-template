require_relative '../render'

module SnippetTemplate
  class Hobby < Template
    def initialize
      @hobby = "programming"
    end
    def view
    return %{
      My Hobby is play <%= @hobby %>
    }
    end
  end
end