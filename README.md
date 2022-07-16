# Snippet Template 

## features

* Snippet Template Support (base on ERB)
* Template can nest & import each other
* Template support local state & Parent template inject props
* Scaffold CMD interface support run cmd to inject files into project


# Config

1. Template Search Path

example

```ruby
SnippetTemplate::Snippet.configure do |config|
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



# CLI interface


try to find help

```
$./scaffold.rb --help

Usage: scaffold.rb [options]
    -t, --template=Template          Choose snippet template
    -p, --props=Props                Inject props data to template
    -o, --output=Output              Inject files to output path
```

example

```shell
./scaffold.rb  -t react -p name:homepage,title:welcome -o dist/welcome.jsx
```

conventional:

```
--props  <key1>:<val1>,<key2>:<val2>, ....

# will transfer to

{
  :key1: val1,
  :key2: val2
  ...
}

# then you can use in template
```