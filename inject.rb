
require './render'

module SnippetTemplate
  class Inject
    include InjectCommon

    def << self
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
        self.class.write_result(job[:output], content)
      end
    end
  end
end
