SELECT
	u.name_user AS usuario,
	COUNT(h.id_user) AS qt_de_musicas_ouvidas,
    ROUND(SUM(s.duration)/60, 2) AS total_minutos
FROM SpotifyClone.user u
INNER JOIN SpotifyClone.user_song h ON u.id_user = h.id_user
INNER JOIN SpotifyClone.song s ON s.id_song = h.id_song
GROUP BY usuario
ORDER BY usuario;