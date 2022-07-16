require_relative '../bin/render'

module SnippetTemplate
  class MithrilPage < Template
    def initialize(props)
      @props = props || {}
    end
    def view
    return %{
      Mithril is from views
    }
    end
  end
end