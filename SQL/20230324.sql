CREATE TABLE albums(
	album_id bigserial GENERATED ALWAYS AS IDENTITY,
	catalog_code text,
	title text,
	artist text,
	release_date date,
	genre text,
	description text
);
CREATE TABLE songs(
	song_id bigserial GENERATED ALWAYS AS IDENTITY,
	title text REFERENCES albums(title),
	composers text,
	album_id bigint REFERENCES albums(album_id)
);