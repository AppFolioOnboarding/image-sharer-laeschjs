import React, { Component } from 'react';
import { observer } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';

@observer
class FeedbackForm extends Component {
  render() {
    const store = this.props.store;
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
        <Button color='primary'>Submit</Button>
      </Form>
    );
  }
}

export default FeedbackForm;
