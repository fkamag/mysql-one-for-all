SELECT COUNT(h.id_user) AS quantidade_musicas_no_historico
FROM SpotifyClone.user u
INNER JOIN SpotifyClone.user_song h ON h.id_user = u.id_user
WHERE u.name_user = 'Barbara Liskov';