require 'yaml'
require_relative './render'

class Snippet
  include ERBRender
  def initialize()

    @config = YAML.load_file('./config.yml')

    @setting = @config[:setting]
    @jobs = @config[:jobs]
  end

  def make_render(job)
    render(job, @jobs[job].fetch(:locals))
  end

  def write_snippet(job_name,content)
    dir = @jobs[job_name][:dir]
    filename = @jobs[job_name][:file_name]
    File.open("#{dir}/#{filename}", 'w') { |f|
      f << content
    }
  end

  def build
    jobs = @jobs.keys
    jobs.each do |job_name|
      snippet_content = self.make_render(job_name)
      write_snippet(job_name,snippet_content)
    end
  end
end

s = Snippet.new

puts s.build