import { expect } from 'chai';
import sinon from 'sinon';
import { describe, it } from 'mocha';
import { PostFeedbackService } from '../../services/PostFeedbackService';

const helper = require('../../utils/helper');

describe('Post Feedback Service', () => {
  it('Can submit the feedback', () => {
    const stub = sinon.stub(helper, 'post');
    stub.resolves();

    const callback = sinon.spy();
    const feedbackStore = {
      feedbackDetails: {
        test: 'test'
      }
    };
    PostFeedbackService.submit(feedbackStore, callback);

    setTimeout(() => {
      // Need to wait for the promise to resolve
      expect(callback.calledOnce).to.equal(true);
    }, 0.5);
    expect(stub.calledOnce).to.equal(true);
  });
});
