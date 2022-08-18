SELECT
	ar.name_artist AS artista,
    al.name_album AS album
FROM SpotifyClone.artist ar
INNER JOIN SpotifyClone.album al ON al.id_artist = ar.id_artist
WHERE ar.name_artist = 'Elis Regina'
ORDER BY album;