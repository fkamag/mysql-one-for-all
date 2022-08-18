SELECT
	s.name_song AS cancao,
    COUNT(h.id_song) AS reproducoes
FROM SpotifyClone.song s
INNER JOIN SpotifyClone.user_song h ON h.id_song = s.id_song
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;