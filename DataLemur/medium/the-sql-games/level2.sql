select
	FLOOR(SUM(CASE WHEN (status = 'alive' and isinsider IS false) THEN 1 ELSE NULL END) * 0.9) AS feed,
	CASE
		WHEN FLOOR(SUM(CASE WHEN (status = 'alive' and isinsider IS false) THEN 1 ELSE NULL END) * 0.9) <= (SELECT amount FROM rations)
		THEN TRUE ELSE FALSE END AS issufficient
from player
