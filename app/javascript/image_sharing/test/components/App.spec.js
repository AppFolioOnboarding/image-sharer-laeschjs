import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';

import App from '../../components/App';

describe('<App />', () => {
  it('renders Header and Footer', () => {
    const app = shallow(<App stores={null} />).dive();
    const header = app.find('Header');
    const footer = app.find('Footer');
    expect(header).to.have.lengthOf(1);
    expect(footer).to.have.lengthOf(1);
    expect(header.prop('title')).to.equal('Tell us what you think');
    expect(footer.prop('content')).to.equal('Copyright ©: Appfolio Inc. Onboarding');
  });
});
