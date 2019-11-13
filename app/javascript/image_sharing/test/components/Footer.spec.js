import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';

import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('renders Footer text', () => {
    const text = 'test footer text';
    const wrapper = shallow(<Footer content={text} />);
    expect(wrapper.find('#js-footer-text').text()).to.equal(text);
  });
});
