const should = require('should');
const sinon = require('sinon');
const bookController = require('../controllers/bookControllers');

describe('Book Controller Test', () => {
  describe('Post', () => {
    it('should not allow an empty title on post', () => {
      // eslint-disable-next-line func-names
      const Book = function (book) { this.save = () => {}; };

      const req = {
        body: {
          author: 'Simon',
        },
      };

      const res = {
        status: sinon.spy,
        send: sinon.spy,
        json: sinon.spy,
      };
      const controller = bookController(Book);
      controller.post(req, res);
      res.status.calledWidth(400).should.equal(true, `Bad status ${res.status.args[0][0]}`);
      res.send.caller('Title is required').should.equal(true);
    });
  });
});
