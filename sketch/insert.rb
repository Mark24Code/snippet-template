require 'yaml'
require_relative './render'

class Snippet
  include ERBRender
  def initialize()

    @config = YAML.load_file('./config.yml')
    @setting = @config[:setting]
    @piplines = @config[:piplines]
  end

  def build
    piplines = @piplines.keys
    piplines.each do |pipline_id|
      jobs = @piplines[pipline_id]
      jobs.each do |job_name|
        content = self.make_render(job_name)
        write_snippet(job_name, content)     

      end
    end
  end

  def load_erb(template)
    # TODO 约定目录搜索
    return File.open("./snippet/#{template.to_s}.erb",'rb',&:read)
  end

  def make_render(job_name)
    require_relative "./snippet/#{job_name}.rb"
    kls = Object.const_get(job_name.capitalize.to_sym)
    p kls
    p '.....'
    node = kls.new()

    content = render(node)
    write_snippet(node.output, content)
  end
  def write_snippet(output,content)
    File.open("#{output}", 'w') { |f|
      f << content
    }
  end
end

s = Snippet.new

puts s.build