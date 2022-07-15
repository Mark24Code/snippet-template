require 'yaml'
require_relative './render'

class Snippet
  include ERBRender
  def initialize()

    @config = YAML.load_file('./config.yml')

    @setting = @config[:setting]
    @slots = @config['slots']
  end

  def make_render(slot)
    p '????'
    p @slots[slot].fetch('locals')
    render(slot.to_sym, @slots[slot].fetch('locals'))
  end

  def build
    jobs = @slots.keys
    jobs.each do |job_name|
      self.make_render(job_name)
    end
  end
end

s = Snippet.new

puts s.build