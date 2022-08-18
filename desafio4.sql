SELECT
	u.name_user AS usuario, 
	IF(YEAR(MAX(h.date_played))>=2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user_song h
INNER JOIN SpotifyClone.user u ON u.id_user = h.id_user
GROUP BY usuario
ORDER BY usuario;