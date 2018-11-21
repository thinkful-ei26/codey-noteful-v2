'use strict';

const knex = require('../knex');

let searchTerm = 'gaga';
let id = '1003';

knex
  .select('notes.id', 'title', 'content')
  .from('notes')
  .modify(queryBuilder => {
    if (searchTerm) {
      queryBuilder.where('title', 'like', `%${searchTerm}%`);
    }
  })
  .orderBy('notes.id')
  .then(results => {
    console.log(JSON.stringify(results, null, 2));
  })
  .catch(err => {
    console.error(err);
  });

knex
  .select('notes.id', 'title', 'content')
  .from('notes')
  .where('id', id)
  .then(results => {
    console.log(JSON.stringify(results));
  })
  .catch(err => {
    console.error(err);
  });

knex
  .update('title', 'This is a new Title')
  .from('notes')
  .where('id', id)
  .then(results => {
    console.log(JSON.stringify(results));
  })
  .catch(err => {
    console.error(err);
  });

knex
  .insert({title: 'new title', content: 'Some content yo'})
  .from('notes')
  .then(results => {
    console.log(JSON.stringify(results));
  })
  .catch(err => {
    console.error(err);
  });

knex
  .del()
  .from('notes')
  .where('id', id)
  .then(results => {
    console.log(JSON.stringify(results));
  })
  .catch(err => {
    console.error(err);
  });