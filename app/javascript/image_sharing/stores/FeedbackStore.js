import { observable, action } from 'mobx';

export class FeedbackStore {
  /* Implement your feedback store*/
  @observable feedbackDetails = {
    name: '',
    comment: ''
  }

  @action
  setAttr = attr => function (event) {
    this.feedbackDetails[attr] = event.target.value;
  }.bind(this);
}

export default FeedbackStore;
