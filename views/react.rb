require_relative '../bin/render'

module SnippetTemplate
  class React < Template
    def initialize(props)
      @props = props || {}
    end
    def view
    return %{
import React from 'react';
import Page from '~/hoc/page';

@Page({
  needLogin: true
})
class <%= @props[:name].capitalize %> extends React.Component {
  componentDidMount() {
    window.document.title = "<%= @props[:title] %>";
  }

  render() {
    return <div className="<%= @props[:name].downcase %>"><%= @props[:name].downcase %></div>
  }
}

export default <%= @props[:name].capitalize! %>;
    }
    end
  end
end



