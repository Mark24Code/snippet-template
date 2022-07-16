require_relative '../bin/render'

module SnippetTemplate
  class Demo < Template
    def initialize(props)
      @props = props || {}
    end
    def view
    return %{
      DEMO is from views
    }
    end
  end
end