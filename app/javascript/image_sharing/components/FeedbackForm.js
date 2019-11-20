import React, { Component } from 'react';
import { observer, inject } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';
import { PostFeedbackService } from '../services/PostFeedbackService';

@inject('feedbackStore')
@inject('uiStore')
@observer
class FeedbackForm extends Component {
  render() {
    const store = this.props.feedbackStore;
    return (
      <Form>
        <FormGroup>
          <Label for="name">Name</Label>
          <Input type="text" id="name" value={store.feedbackDetails.name} onChange={store.setAttr('name')} />
        </FormGroup>
        <FormGroup>
          <Label for="comment">Comment</Label>
          <Input type="text" id='comment' value={store.feedbackDetails.comment} onChange={store.setAttr('comment')} />
        </FormGroup>
        <Button onClick={this.submit} color='primary'>Submit</Button>
      </Form>
    );
  }

  submit = () => {
    PostFeedbackService.submit(this.props.feedbackStore, (response) => {
      this.props.uiStore.setSubmit(response.result);
    });
  }
}

export default FeedbackForm;
