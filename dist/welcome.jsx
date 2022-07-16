
import React from 'react';
import Page from '~/hoc/page';

@Page({
  needLogin: true
})
class Homepage extends React.Component {
  componentDidMount() {
    window.document.title = "welcome"
  }

  render() {
    return <div className="homepage">homepage</div>
  }
}

export default Homepage;
    