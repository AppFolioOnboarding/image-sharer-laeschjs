import { post } from '../utils/helper';

export class PostFeedbackService {
  /* Implement your service */
  static submit = (feedbackStore, callback) => {
    post('/api/feedbacks', feedbackStore.feedbackDetails).then(callback);
  }
}

export default PostFeedbackService;
