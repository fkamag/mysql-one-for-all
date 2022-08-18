SELECT
	ar.name_artist AS artista,
    al.name_album AS album,
    COUNT(f.id_artist) AS seguidores
FROM SpotifyClone.artist ar
INNER JOIN SpotifyClone.album al ON al.id_artist = ar.id_artist
INNER JOIN SpotifyClone.user_artist f ON f.id_artist = ar.id_artist
GROUP BY album
ORDER BY seguidores DESC, artista, album;