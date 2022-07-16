
require './render'

module InjectCommon
  def write_result(output,content)
    File.open("#{output}", 'w') { |f|
      f << content
    }
  end
end

class Inject
  include InjectCommon

  def initialize(jobs)
    @jobs = jobs || []
  end

  def start
    @jobs.each do |job|
      content = render({name: job[:snippet], props: job[:props]})
      write_result(job[:output], content)
    end
  end
end

