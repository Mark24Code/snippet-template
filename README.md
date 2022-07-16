# Template Snippet

* Snippet Template 
* Snippet Inject
* Snippet Scaffold


# Config

1. Template Search Path

example

```ruby
Snippet.configure do |config|
  config.snippet_path = './snippet'
end

```


| config field | type | example |extra info |
|----|----|----|----|
|snippet_path | string\|Array| `'./snippet'` `['.', './views']`| default: `./snippet` |


# Conventional


## Snippet Class

`render`  provide basic inner Class

snippet class must provide

* `initialize` method with `props` arguments
* `view` method return erb template

view template can access data from local instance attribute and props.


```ruby
require_relative '../render'

module SnippetTemplate
  class Demo < Template
    def initialize(props)
      @props = props || {}
      @state = "Demo"
    end

    def view
    return %{

      Hello World
      data from local <%= @state %>
      data from props <%= @props %>
    }
    end
  end
end
```

## Nest Snippet Template


```ruby
require_relative '../render'

module SnippetTemplate
  class Sub < Template
    def initialize(props)
      @props = props || {}
    end

    def view
    return %{
      Sub Template
      Props from Parent: <%= @props[:message] %>
    }
    end
  end
end
```

```ruby
require_relative '../render'

module SnippetTemplate
  class Parent < Template
    def initialize(props)
      @props = props || {}
    end

    def view
    return %{
      Parent Template
      <%= render(:sub, { message: "hi"}) %>
    }
    end
  end
end
```

You can use render method to call other Snippet Template.

Well, it will search snippet template within `config.snippet_path`.

### >>> conventional: the name of snippet template file and it's Class name must be same. To make sure we can find the correct snippet. <<<

