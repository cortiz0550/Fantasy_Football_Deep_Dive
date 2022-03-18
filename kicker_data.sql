SELECT 
	game_id,
	player,
	Off_abbrev,
	Def_abbrev,
	xpa,
	xpm,
	CAST(xpm AS float) / NULLIF(CAST(xpa AS float),0) AS xpm_pct,
	fga,
	fgm,
	CAST(fgm AS float) / NULLIF(CAST(fga AS float),0) AS fgm_pct,
	fga_0_39,
	fgm_0_39,
	fga_40_49,
	fgm_40_49,
	fga_50,
	fgm_50,
	game_date,
		CAST(fgm_0_39 AS int) * 3 +
		CAST(fgm_40_49 AS int) * 4 +
		CAST(fgm_50 AS int) * 5 + 
		CAST(xpm AS int) * 1 AS ff_points
FROM Fantasy_Football_21.dbo.kicker_data
