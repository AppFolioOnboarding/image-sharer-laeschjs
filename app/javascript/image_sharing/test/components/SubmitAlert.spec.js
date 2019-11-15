import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { beforeEach, describe, it } from 'mocha';

import { UIStore } from '../../stores/UIStore';
import SubmitAlert from '../../components/SubmitAlert';

describe('<SubmitAlert />', () => {
  let uiStore;
  let wrapper;

  beforeEach(() => {
    uiStore = new UIStore();
    wrapper = shallow(<SubmitAlert uiStore={uiStore} />).dive();
  });

  it('renders a success alert', () => {
    uiStore.setSubmit('success');
    expect(wrapper.find('Alert').prop('color')).to.equal('success');
    expect(wrapper.find('Alert').childAt(0).text()).to.equal('You successfully submitted the feedback!');
  });

  it('renders an error alert', () => {
    uiStore.setSubmit('This is the error message');
    expect(wrapper.find('Alert').prop('color')).to.equal('danger');
    expect(wrapper.find('Alert').childAt(0).text()).to.equal('This is the error message');
  });

  it('renders nothing before a submission', () => {
    expect(wrapper.find('Alert').prop('color')).to.equal('');
    expect(wrapper.childAt(0)).to.have.lengthOf(0);
  });
});
