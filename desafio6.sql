SELECT
	MIN(p.price_plan) AS faturamento_minimo,
    MAX(p.price_plan) AS faturamento_maximo,
    ROUND(AVG(p.price_plan), 2) AS faturamento_medio,
    SUM(p.price_plan) AS faturamento_total
FROM SpotifyClone.plan p
INNER JOIN SpotifyClone.user u ON u.id_plan = p.id_plan;