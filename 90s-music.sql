-- Create tables
CREATE TABLE artists (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  genre VARCHAR(50)
);

CREATE TABLE albums (
  id INT PRIMARY KEY,
  artist_id INT,
  title VARCHAR(100),
  release_year INT,
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE songs (
  id INT PRIMARY KEY,
  album_id INT,
  title VARCHAR(100),
  duration_seconds INT,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Insert sample data
INSERT INTO artists VALUES
  (1, 'Nirvana', 'Grunge'),
  (2, 'TLC', 'R&B'),
  (3, 'Backstreet Boys', 'Pop');

INSERT INTO albums VALUES
  (1, 1, 'Nevermind', 1991),
  (2, 2, 'CrazySexyCool', 1994),
  (3, 3, 'Millennium', 1999);

INSERT INTO songs VALUES
  (1, 1, 'Smells Like Teen Spirit', 301),
  (2, 2, 'Waterfalls', 240),
  (3, 3, 'I Want It That Way', 213);

-- Sample queries
-- 1. Get all artists
SELECT * FROM artists;

-- 2. Get songs with album titles and artist names
SELECT s.id, s.title AS song, a.title AS album, ar.name AS artist, s.duration_seconds
FROM songs s
JOIN albums a ON s.album_id = a.id
JOIN artists ar ON a.artist_id = ar.id;
