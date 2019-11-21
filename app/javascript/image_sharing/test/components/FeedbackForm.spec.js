import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import sinon from 'sinon';
import { afterEach, beforeEach, describe, it } from 'mocha';
import FeedbackForm from '../../components/FeedbackForm';
import { FeedbackStore } from '../../stores/FeedbackStore';
import { PostFeedbackService } from '../../services/PostFeedbackService';

describe('<FeedbackForm />', () => {
  let feedbackStore;
  let wrapper;
  const sandbox = sinon.createSandbox();

  beforeEach(() => {
    feedbackStore = new FeedbackStore();
    wrapper = shallow(<FeedbackForm feedbackStore={feedbackStore} uiStore={null} />).dive().dive();
    sandbox.stub(PostFeedbackService, 'submit');
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('renders the feedback form', () => {
    expect(wrapper.find('Input[id="name"]')).to.have.lengthOf(1);
    expect(wrapper.find('Input[id="comment"]')).to.have.lengthOf(1);
    expect(wrapper.find('Button').dive().text()).to.equal('Submit');
  });

  it('updates the store', () => {
    wrapper.find('Input[id="name"]').simulate('change', { target: { value: 'Bob' } });
    expect(wrapper.find('Input[id="name"]').prop('value')).to.equal('Bob');
    wrapper.find('Input[id="comment"]').simulate('change', { target: { value: 'Comment' } });
    expect(wrapper.find('Input[id="comment"]').prop('value')).to.equal('Comment');
  });

  it('Can submit the feedback', () => {
    wrapper.find('Button').simulate('click');
    sandbox.assert.calledOnce(PostFeedbackService.submit);
  });
});
