
require_relative './render'

module SnippetTemplate
  class Inject
    class << self
      def write_result(output,content)
        File.open("#{output}", 'w') { |f|
          f << content
        }
      end
    end

    def initialize(jobs)
      @jobs = jobs || []
    end

    def start
      @jobs.each do |job|
        content = render({name: job[:snippet], props: job[:props]})
        
        output_path = job[:output]
        output_dir = File.dirname(output_path)
        if !File.directory?(output_dir)
          system("mkdir -p #{output_dir}")
        end
        self.class.write_result(output_path, content)
      end
    end
  end
end
