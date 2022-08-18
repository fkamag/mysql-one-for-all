SELECT
	s.name_song AS nome,
    COUNT(h.id_user) AS reproducoes
FROM SpotifyClone.user u
INNER JOIN SpotifyClone.user_song h ON h.id_user = u.id_user
INNER JOIN SpotifyClone.song s ON s.id_song = h.id_song
WHERE u.id_plan = 1 OR u.id_plan = 4
GROUP BY nome
ORDER BY nome;