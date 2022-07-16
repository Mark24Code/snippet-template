require './render'

SnippetTemplate::Snippet.configure do |config|
  config.snippet_path = './views' #['./snippet', './views']
end

puts render({name: :demo , props: { name: "about" }})