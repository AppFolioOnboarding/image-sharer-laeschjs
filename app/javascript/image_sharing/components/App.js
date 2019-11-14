import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Header from './Header';
import Footer from './Footer';
import FeedbackForm from './FeedbackForm';

class App extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div>
        <Header title='Tell us what you think' />
        {/* Put your components here: Flash Message, Form, Footer */}
        <FeedbackForm store={this.props.stores.feedbackStore} />
        <Footer content='Copyright &copy;: Appfolio Inc. Onboarding' />
      </div>
    );
  }
}

export default inject('stores')(App);
