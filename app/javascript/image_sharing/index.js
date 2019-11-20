import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'mobx-react';
import App from './components/App';
import { FeedbackStore } from './stores/FeedbackStore';
import { UIStore } from './stores/UIStore';

/* Initialize your store here*/

ReactDOM.render(
  <Provider
    feedbackStore={new FeedbackStore()}
    uiStore={new UIStore()}
  >
    <App />
  </Provider>,
  document.getElementById('feedback-root')
);
