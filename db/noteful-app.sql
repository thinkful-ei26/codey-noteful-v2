-- psql -U dev -d noteful-app -f projects\noteful-app-v2\db\noteful-app.sql

DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS folders;

CREATE TABLE folders (
    id serial PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE notes (
    id serial PRIMARY KEY,
    title text NOT NULL,
    content text,
    created date,
    folder_id int REFERENCES folders(id) ON DELETE SET NULL
);

ALTER SEQUENCE notes_id_seq RESTART WITH 1000;
ALTER SEQUENCE folders_id_seq RESTART WITH 100;

INSERT INTO folders (name) VALUES
  ('Archive'),
  ('Drafts'),
  ('Personal'),
  ('Work');

INSERT INTO notes (title, content, folder_id)
    VALUES  (
    '5 life lessons learned from cats',
    'Lorem ipsum dolor sit.',
    101
  ),
  (
    'What the government doesnt want you to know about cats',
    'Posuere sollicitudin aliquam ultrices.',
    101
  ),
  (
    'The most boring article about cats youll ever read',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
    101
  ),
  (
    '7 things lady gaga has in common with cats',
    'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit.',
    102
  ),
  (
    'The most incredible article about cats youll ever read',
    'Lorem ipsum dolor sit amet, boring consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
    100
  ),
  (
    '10 ways cats can help you live to 100',
    'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam.',
    100
  ),
  (
    '9 reasons you can blame the recession on cats',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    100
  ),
  (
    '10 ways marketers are making you addicted to cats',
    'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit.',
    100
  ),
  (
    '11 ways investing in cats can make you a millionaire',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
    100
  ),
  (
    'Why you should forget everything you learned about cats',
    'Posuere sollicitudin aliquam ultrices sagittis orci ilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus.',
    100
  );

-- get all notes with folders
SELECT * FROM notes
  INNER JOIN folders ON notes.folder_id = folders.id;

-- get all notes, show folders if they exists otherwise null
SELECT * FROM notes
  LEFT JOIN folders ON notes.folder_id = folders.id;

-- get all notes, show folders if they exists otherwise null
SELECT * FROM notes
  LEFT JOIN folders ON notes.folder_id = folders.id
  WHERE notes.id = 1005;