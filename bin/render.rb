require 'erb'
require_relative '../utils/string_patch'

using StringPatch

def render(opt)
  name = opt[:name]
  props = opt[:props] || {}
  SnippetTemplate::Snippet.new(name, props).result
end

module SnippetTemplate
  class Template
    def initialize(props)
      @props = props || {}
    end

    def get_binding
      binding
    end
    
    def view
      
    end
  end


  class Configuration
    attr_accessor :snippet_path # expect string or array
  end
  
  class Snippet
    class << self
      def config
        @config ||= Configuration.new
      end
  
      def configure
        yield config
      end
  
      def require_mod(path)
        require path
      end
  
      def require_template(name)
        search_path = @config.snippet_path
    
        if search_path.instance_of? String
          search_path = [].push(search_path)
        end
    
        if search_path.instance_of? Array
          for try_path in search_path
            f = Dir["#{try_path}/#{name.to_s.snake_case}.rb"]
            if f.any?
              self.require_mod(f.first);
              break
            end
          end
        end
      end
    end
  
  
  
  
    def initialize(name, props)
      @name = name
      @props = props
    end
  
    def get_binding
      binding
    end
  
    def result
      self.class.require_template(@name)
      targetKls = Object.const_get("SnippetTemplate::#{@name.camel_case}")
      node = targetKls.new(@props)
      template = node.view
      return ERB.new(template).result(node.get_binding)
    end
  
    def render(opt)
      name = opt[:name]
      self.class.new(name).result
    end
  end
end