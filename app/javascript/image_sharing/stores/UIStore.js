import { observable, action } from 'mobx';

export class UIStore {
  @observable submit = {
    color: '',
    message: ''
  };

  @action
  setSubmit = (message) => {
    if (message === 'success') {
      this.submit = {
        color: 'success',
        message: 'You successfully submitted the feedback!'
      };
    } else {
      this.submit = {
        color: 'danger',
        message
      };
    }
  }
}

export default UIStore;
