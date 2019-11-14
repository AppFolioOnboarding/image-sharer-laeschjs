import { expect } from 'chai';
import { beforeEach, describe, it } from 'mocha';

import { FeedbackStore } from '../../stores/FeedbackStore';

describe('Feedback Store', () => {
  let feedbackStore;

  beforeEach(() => {
    feedbackStore = new FeedbackStore();
  });

  it('is able to have properties set', () => {
    const setName = feedbackStore.setAttr('name');
    setName({ target: { value: 'Bob' } });
    expect(feedbackStore.feedbackDetails.name).to.equal('Bob');

    const setComment = feedbackStore.setAttr('comment');
    setComment({ target: { value: 'test comment' } });
    expect(feedbackStore.feedbackDetails.comment).to.equal('test comment');
  });
});
