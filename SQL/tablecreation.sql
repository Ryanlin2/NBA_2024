-- =========================
-- SEASON TABLE
-- =========================
CREATE TABLE season (
    season_id VARCHAR PRIMARY KEY,
    season VARCHAR
);

-- =========================
-- TEAM TABLE
-- =========================
CREATE TABLE team (
    team_id BIGINT PRIMARY KEY,
    team_abbreviation VARCHAR NOT NULL,
    team_name VARCHAR NOT NULL
);

-- =========================
-- GAME TABLE
-- =========================
CREATE TABLE game (
    game_id BIGINT PRIMARY KEY,
    season_id VARCHAR NOT NULL,
    game_date TIMESTAMP NOT NULL,

    CONSTRAINT fk_game_season
        FOREIGN KEY (season_id)
        REFERENCES season(season_id)
);

-- =========================
-- TEAM GAME STATS TABLE
-- =========================
CREATE TABLE team_game_stats (
    game_id BIGINT NOT NULL,
    team_id BIGINT NOT NULL,

    wl VARCHAR NOT NULL,
    home_team BOOLEAN NOT NULL,

    min INT NOT NULL,
    pts INT NOT NULL,

    fgm INT NOT NULL,
    fga INT NOT NULL,
    fg_pct FLOAT NOT NULL,

    fg3m INT NOT NULL,
    fg3a INT NOT NULL,
    fg3_pct FLOAT NOT NULL,

    ftm INT NOT NULL,
    fta INT NOT NULL,
    ft_pct FLOAT,

    oreb INT NOT NULL,
    dreb INT NOT NULL,
    reb INT NOT NULL,

    ast INT NOT NULL,
    stl INT NOT NULL,
    blk INT NOT NULL,

    tov INT NOT NULL,
    pf INT NOT NULL,

    plus_minus FLOAT NOT NULL,

    PRIMARY KEY (game_id, team_id),

    CONSTRAINT fk_stats_game
        FOREIGN KEY (game_id)
        REFERENCES game(game_id),

    CONSTRAINT fk_stats_team
        FOREIGN KEY (team_id)
        REFERENCES team(team_id)
);

CREATE TABLE staging_team_game_stats_raw (
    season_id VARCHAR,
    team_id BIGINT,
    team_abbreviation VARCHAR,
    team_name VARCHAR,
    game_id BIGINT,
    game_date DATE,
    matchup VARCHAR,
    wl VARCHAR,
    min INT,
    pts INT,
    fgm INT,
    fga INT,
    fg_pct FLOAT,
    fg3m INT,
    fg3a INT,
    fg3_pct FLOAT,
    ftm INT,
    fta INT,
    ft_pct FLOAT,
    oreb INT,
    dreb INT,
    reb INT,
    ast INT,
    stl INT,
    blk INT,
    tov INT,
    pf INT,
    plus_minus FLOAT,
    home_team BOOLEAN
);