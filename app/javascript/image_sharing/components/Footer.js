import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Col, Row } from 'reactstrap';

class Footer extends Component {
  /* Implement your Footer component here */
  static propTypes = {
    content: PropTypes.string.isRequired
  };

  render() {
    return (
      <div className="fixed-bottom">
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <p id='js-footer-text' className='text-center'>
              {this.props.content}
            </p>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Footer;
