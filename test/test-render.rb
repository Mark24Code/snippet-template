require './bin/render'

SnippetTemplate::Snippet.configure do |config|
  config.snippet_path = './views'
end

puts render({name: :demo , props: { name: "about" }})