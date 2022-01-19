/* eslint-disable no-underscore-dangle */
/* eslint-disable space-in-parens */
/* eslint-disable no-param-reassign */
// eslint-disable-next-line no-param-reassign
const express = require('express');
const bookControllers = require('../controllers/bookControllers');

function routes(Book) {
  const bookRouter = express.Router();
  const controller = bookControllers(Book);
  bookRouter.route('/book')
    .get(controller.get)
    .post(controller.post);
  bookRouter.use('/book/:id', (req, res, next) => {
    Book.findById(req.params.id, (err, book) => {
      if (err) {
        return res.send(err);
      }
      if (book) {
        req.book = book;
        return next();
      }
      return res.sendStatus(404);
    });
  });
  bookRouter.route('/book/:id').get((req, res) => res.json(req.book)).put((req, res) => {
    const { book } = req;
    book.title = req.body.title;
    book.author = req.body.author;
    book.genre = req.body.genre;
    book.read = req.body.read;
    book.save();
    res.json(book);
  }).patch((req, res) => {
    const { book } = req;
    if (req.body._id) {
      delete req.body._id;
    }
    Object.entries(req.body).forEach( (item) => {
      const key = item[0];
      const value = item[1];
      book[key] = value;
    });
    req.book.save( (err) => {
      if ( err) {
        return res.send(err);
      }
      return res.json(req.book);
    });
  })
    .delete((req, res) => {
      req.book.remove( (err) => {
        if (err) {
          return res.send(err);
        }
        return res.sendStatus(500);
      });
    });
  return bookRouter;
}

module.exports = routes;
