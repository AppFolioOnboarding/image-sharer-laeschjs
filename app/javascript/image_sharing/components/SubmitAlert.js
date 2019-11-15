import React, { Component } from 'react';
import { Alert } from 'reactstrap';
import { observer, inject } from 'mobx-react';

@inject('uiStore')
@observer
class SubmitAlert extends Component {
  render() {
    return (
      <Alert color={this.props.uiStore.submit.color}>
        {this.props.uiStore.submit.message}
      </Alert>);
  }
}

export default SubmitAlert;
