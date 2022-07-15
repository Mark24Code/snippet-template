import React from 'react';
import Page from '~/hoc/page';

@Page({
  needLogin: true
})

class Actor extends React.Component {
  render() {
    return <div className="actor">
      Actor
      <div>sample {:name=>"Hello world"}</div>
    </div>
  }
}

export default Actor;