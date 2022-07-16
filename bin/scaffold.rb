#!/usr/bin/env ruby

require 'optparse'
require_relative './inject'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: scaffold.rb [options]"

  opts.on("-tTemplate", "--template=Template", "Choose snippet template") do |v|
    options[:template] = v
  end

  opts.on("-pProps", "--props=Props", "Inject props data to template") do |v|
    options[:props] = v
  end

  opts.on("-oOutput", "--output=Output", "Inject files to output path") do |v|
    options[:output] = v
  end
end.parse!

# p options
# p ARGV



def args2kv(argstring)
  # form
  # "name:homepage,title:welcome"
  # to 
  # {:name=>"homepage", :title=>"welcome"}
  result = {}
  argstring.split(",").map do |pair| 
    k,v = pair.split(':')
    result[k.to_sym] = v
  end
  result
end

jobs = [
  {
    snippet: options[:template],
    output: options[:output],
    props: args2kv(options[:props])
  }
]

SnippetTemplate::Snippet.configure do |config|
  config.snippet_path = './views'
end

SnippetTemplate::Inject.new(jobs).start