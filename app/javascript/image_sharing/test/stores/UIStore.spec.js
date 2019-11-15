import { expect } from 'chai';
import { beforeEach, describe, it } from 'mocha';

import { UIStore } from '../../stores/UIStore';

describe('UI Store', () => {
  let uiStore;

  beforeEach(() => {
    uiStore = new UIStore();
  });

  it('is able to have properties set', () => {
    uiStore.setSubmit('success');
    expect(uiStore.submit.color).to.equal('success');
    expect(uiStore.submit.message).to.equal('You successfully submitted the feedback!');

    uiStore.setSubmit('This is the error message');
    expect(uiStore.submit.color).to.equal('danger');
    expect(uiStore.submit.message).to.equal('This is the error message');
  });
});
