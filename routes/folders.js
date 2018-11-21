const express = require('express');

const router = express.Router();

const knex = require('../knex');

// get all folders
router.get('/', (req, res, next) => {
    knex.select('id', 'name')
      .from('folders')
      .then(results => {
        res.json(results);
      })
      .catch(err => next(err));
});

// get folder by id
router.get('/:id', (req, res, next) => {
    let id = req.params.id;
    knex.select('id', 'name')
        .from('folders')
        .where('id', id)
        .then(results => {
            res.json(results);
        })
        .catch(err => {
            return next(err);
        })
});

// update folder by id --this is not an endpoint we will use but are making for practice--
// router.update('/:id', (req, res, next) => {
    
// });

// create a folder
router.post('/', (req, res, next) => {
    const { name } = req.body;

    const newItem = { name };
    /***** Never trust users - validate input *****/
    if (!newItem.name) {
        const err = new Error('Missing `title` in request body');
        err.status = 400;
        return next(err);
    }

    knex.insert(newItem)
        .from('folders')
        .then( results => {
            res.json(results);
        })
        .catch(err => {
            return next(err);
        });
});

// delete a folder
router.delete('/:id', (req, res, next) => {
    let id = req.params.id;
    knex.del()
        .from('folders')
        .where('id', id)
        .then( results => {
        res.json(results).status(204);
        })
        .catch(err => {
        return next(err);
        });
});

module.exports = router;