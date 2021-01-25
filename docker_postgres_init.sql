CREATE TABLE IF NOT EXISTS news (
  id SERIAL PRIMARY KEY,
  headline TEXT NOT NULL,
  text TEXT NOT NULL,
  publication TEXT NOT NULL,
  date TIMESTAMP with time zone NOT NULL
);

CREATE TABLE IF NOT EXISTS tags (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS news_tags(
  news_id INTEGER,
  tag_id INTEGER,
  UNIQUE(news_id, tag_id),
  FOREIGN KEY(news_Id) REFERENCES news(id),
  FOREIGN KEY(tag_id) REFERENCES tags(id)
);


INSERT INTO news (
  headline,
  text,
  publication,
  date
) VALUES (
  'This is a headline',
  'This is a text',
  'New York Times',
  '2021-01-01T00:03:00Z'
);


INSERT INTO tags (
  name
)
VALUES ('Negative'), ('Important'), ('Positive'), ('Archive');


INSERT INTO news_tags (
  news_id,
  tag_id
) VALUES (1, 1), (1, 2);