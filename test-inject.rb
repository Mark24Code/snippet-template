require './inject'

jobs = [
  {
    snippet: 'nick',
    output: 'dist/nick.txt',
    props: { refer: "build from Class-Inject " }
  }
]

Inject.new(jobs).start