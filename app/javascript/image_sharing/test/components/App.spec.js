import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import App from '../../components/App';
import FeedbackForm from '../../components/FeedbackForm';
import SubmitAlert from '../../components/SubmitAlert';

describe('<App />', () => {
  it('renders Header and Footer', () => {
    const app = shallow(<App feedbackStore={null} uiStore={null} />).dive();
    const header = app.find('Header');
    const alert = app.find(SubmitAlert);
    const feedback = app.find(FeedbackForm);
    const footer = app.find('Footer');

    expect(header).to.have.lengthOf(1);
    expect(feedback).to.have.lengthOf(1);
    expect(alert).to.have.lengthOf(1);
    expect(footer).to.have.lengthOf(1);
    expect(header.prop('title')).to.equal('Tell us what you think');
    expect(footer.prop('content')).to.equal('Copyright ©: Appfolio Inc. Onboarding');
  });
});
