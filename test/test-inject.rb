require './inject'

jobs = [
  {
    snippet: 'nick',
    output: 'dist/nick.txt',
    props: { refer: "build from Class-Inject " }
  }
]

SnippetTemplate::Snippet.configure do |config|
  config.snippet_path = './snippet'
end

SnippetTemplate::Inject.new(jobs).start