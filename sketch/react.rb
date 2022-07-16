puts 'CCCCCC'
require_relative '../render'

class Template


  attr :state, :output
  def initialize
    @state = {}
    @ouput = "views"
  end

  def get_binding
    binding
  end

  def view

  end
end

class React < Template
  include ERBRender
  attr :state, :output
  def initialize
    @state = { name: "FFF"}
    @ouput = "views/react.jsx"
  end

  def view
  return %{
import React from 'react';
import Page from '~/hoc/page';

@Page({
  needLogin: true
})

class <%= state[:name] %> extends React.Component {
  render() {
    return <div className="<%= state[:name].downcase %>">
      <%= state[:name] %>
    </div>
  }
}

export default <%= state[:name] %>;
  }
  end
end

