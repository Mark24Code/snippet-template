require './bin/inject'

jobs = [
  {
    snippet: 'demo',
    output: './dist/demo.jsx',
    props: { refer: "build from Class-Inject " }
  }
]

SnippetTemplate::Snippet.configure do |config|
  config.snippet_path = './views'
end

SnippetTemplate::Inject.new(jobs).start