SELECT aws_s3.table_import_from_s3(
    'staging_team_game_stats_raw',
    'season_id, team_id, team_abbreviation, team_name, game_id, game_date, matchup, wl, min, pts, fgm, fga, fg_pct, fg3m, fg3a, fg3_pct, ftm, fta, ft_pct, oreb, dreb, reb, ast, stl, blk, tov, pf, plus_minus, home_team',
    '(format csv, header true, delimiter '','', null '''')',
    aws_commons.create_s3_uri(
        'nba-data-0',
        'silver/2024/nba_league_games_2024-25_standard.csv',
        'us-east-2'
    )
);