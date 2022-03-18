SELECT 
	game_id,
	team, -- This is the team we will calculate the points of --
	def_int,
	(CAST(def_int_td AS int) + CAST(fumbles_rec_td AS int) + CAST(total_ret_td AS int)) AS tds,
	sacks,
	fumbles_rec,
	blocked_kick,
	safety,
	def_two_point_conv,
	Team_abbrev,
	Opponent_abbrev,
	Opponent_score,
	points_allowed_0,
	points_allowed_1_6,
	points_allowed_7_13,
	points_allowed_14_20,
	points_allowed_21_27,
	points_allowed_28_34,
	points_allowed_35,
	vis_team,
	home_team,
	game_date,
		(CAST(def_int_td AS int) + CAST(fumbles_rec_td AS int) + CAST(total_ret_td AS int)) * 6 +
		CAST(sacks AS int) * 1 + 
		CAST(def_int AS int) * 2 +
		CAST(fumbles_rec AS int) * 2 +
		CAST(blocked_kick AS int) * 2 +
		CAST(safety AS int) * 2 +
		CASE
			WHEN CAST(Opponent_score AS int) = 0 THEN 10
			WHEN CAST(Opponent_score AS int) < 7 THEN 7
			WHEN CAST(Opponent_score AS int) < 14 THEN 4
			WHEN CAST(Opponent_score AS int) < 21 THEN 1
			WHEN CAST(Opponent_score AS int) < 28 THEN 0
			WHEN CAST(Opponent_score AS int) < 35 THEN -1
			WHEN CAST(Opponent_score AS int) >= 35 THEN -4
		END +
		CAST(def_two_point_conv AS int) * 2
	AS ff_points
FROM Fantasy_Football_21.dbo.defense_data
WHERE game_id LIKE '20190908%'
ORDER BY
	ff_points DESC;