import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { beforeEach, describe, it } from 'mocha';

import FeedbackForm from '../../components/FeedbackForm';
import { FeedbackStore } from '../../stores/FeedbackStore';

describe('<FeedbackForm />', () => {
  let feedbackStore;
  let wrapper;

  beforeEach(() => {
    feedbackStore = new FeedbackStore();
    wrapper = shallow(<FeedbackForm store={feedbackStore} />);
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
});
