USE RacingForm ;

-- North American Tracks and Abbreviations
 
CREATE TABLE IF NOT EXISTS NorthAmericanTracks (

    TrackCode       CHAR(4),
	ShortName       VARCHAR(24),
	LongName        VARCHAR(36),
	State           CHAR(2),
  PRIMARY KEY (TrackCode)
);
