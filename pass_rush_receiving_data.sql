SELECT
	game_id,
	player_id,
	pos,
	player,
	team,
	pass_yds,
	pass_td,
	pass_int,
	pass_sacked,
	rush_yds,
	rush_td,
	rec,
	rec_yds,
	rec_td,
	fumbles_lost,
	Team_abbrev,
	Opponent_abbrev,
	two_point_conv,
	vis_team,
	home_team,
	game_date,
		CAST(pass_td AS int) * 4 +
		CAST(rush_td AS int) * 6 +
		CAST(rec_td AS int) * 6 +
		ROUND(CAST(pass_yds AS float) / 25, 2) +
		ROUND(CAST(rec_yds AS float) / 10, 2) +
		ROUND(CAST(rush_yds AS float) / 10, 2) +
		CAST(rec AS int) * 1 +
		CAST(two_point_conv AS int) * 2 -
		CAST(pass_int AS int) * 1 -
		CAST(fumbles_lost AS int) * 2
	AS ff_points
FROM Fantasy_Football_21.dbo.pass_rush_receive_data
