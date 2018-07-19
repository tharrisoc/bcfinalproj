
-- This script contains commands that create a database from the data that is 
-- exported from Formulator 4.0.

DROP DATABASE IF EXISTS RacingForm ;
CREATE DATABASE RacingForm ;

USE RacingForm ;

-- Special Products File
--      This file contains Beyer Speed Figures and Mudders and Turfers ratings
--      for an entire race card. The Special Products File has a file extension
--      of .CS, or a name suffix of _s.
 
CREATE TABLE IF NOT EXISTS SpecialProducts (

    RCTrack          CHAR(4),     -- Race Card Track
    RCDate           DATE,        -- Race Card Date
    RCRace           TINYINT,     -- Race Card Race
    Horse            VARCHAR(22), -- Horse
    FD               CHAR(2),     -- Foreign or Domestic
    BestFastDirt     SMALLINT,    -- Best Fast Dirt
    BestTurf         SMALLINT,    -- Best Turf
    BestWet          SMALLINT,    -- Best Win
    BestDistance     SMALLINT,    -- Best Distance
    BestLifetime     SMALLINT,    -- Best Lifetime
    BestCurrentYear  SMALLINT,    -- Best Current Year
    BestPriorYear    SMALLINT,    -- Best Prior Year
    BestTrackSurface SMALLINT,    -- Best Track Surface
    MudTurfMud       CHAR(4),     -- Mudder & Turfers Mud Rating
    MudTurfTurf      CHAR(4),     -- Mudder & Turfers Turf Rating
    MudTurfDistance  CHAR(4),     -- Mudder & Turfers Distance Rating
  PRIMARY KEY (RCTrack,RCDate,RCRace,Horse),
          KEY (Horse)
);

-- Workout File
--  This file contains workout level information for all horses on the
--  race card. The Workout File has a file extension of .CW, or a name
--  suffix of _w.

CREATE TABLE IF NOT EXISTS Workout (
    RCTrack    CHAR(4),       -- Race Card Track,
    RCDate     DATE,          -- Race Card Date,
    RCRace     TINYINT,       -- Race Card Race,
    Horse      VARCHAR(22),   -- Horse
    FD         CHAR(2),       -- Foreign or Domestic
    Track      CHAR(4),
    DateofWork DATE,          -- mm/dd/yyyy
    Surface    CHAR(2),
    Distance   DECIMAL(6,2),  
    TrkCond    CHAR(4),       -- track condition
    WorkType   CHAR(2),       -- workout type
    WorkTime   DECIMAL(6,2),  -- workout time
    Bullet     CHAR(2),
    Comment    VARCHAR(16),
    Rank       INTEGER,
    RankIn     INTEGER,
    Race       INTEGER,
    DistUnit   CHAR,
    TimeUnit   CHAR,
  PRIMARY KEY (RCTrack,RCDate,RCRace,Horse,Track,DateofWork),
          KEY (Horse,Track,DateofWork),
          KEY (Horse,DateofWork)
);

-- Race File
--  This file contains race level information for all races on the race card.
--  The Race File has a file extension of .CR, or a name suffix of _r.

CREATE TABLE IF NOT EXISTS Race (
    RCTrack        CHAR(4),        -- Race Card Track
    RCDate         DATE,           -- Race Card Date
    RCRace         TINYINT,        -- Race Card Race
    Starters       TINYINT,        -- Number of starters
    TrackName      VARCHAR(40),    -- Race Track Name
    RaceState      CHAR(2),        -- Race Track State
    Division       CHAR(2),        -- Race Division
    RaceBred       CHAR(2),        -- Race Breed
    StateBred      CHAR(2),        -- State Bred race
    RaceSex        CHAR(2),        -- Sex of race
    RaceAge        CHAR(2),        -- Age of race
    Class          CHAR(4),        -- Class of race
    Purse          DECIMAL(10,3),  -- In Thousands
    HiClaim        DECIMAL(10,3),  -- High Claim Price in Thousands
    LoClaim        DECIMAL(10,3),  -- Low Claim Price in Thousands
    Distance       DECIMAL(6,3),   -- Distance of race
    InnerCode      CHAR(2),        -- Inner/outer/chute
    Surface        CHAR(2),        -- Dirt/turf
    RaceType       CHAR(2),        -- Regular/amatuer
    GradedRace     TINYINT,        -- American/Canadian Grade 1-3
    GradedRaceDesc VARCHAR(46),    -- Description
    SimTrack       CHAR(4),        -- Simulcast track
    SimRace        TINYINT,        -- Simulcast race
    TrackRecord    DECIMAL(6,2),   -- Track Record
    DayOf_Week     VARCHAR(10),    -- Day of Week
    PostTime       CHAR(6),        -- "3:36"
    LongClass      VARCHAR(14),
    TrkAbbrev      VARCHAR(30),
    DistUnit       CHAR(2),
    TimeUnit       CHAR(2),
    Conditions     MEDIUMTEXT,
  PRIMARY KEY (RCTrack,RCDate,RCRace)
);

-- Comprehensive Trainer Statistics File
--  This file contains comprehensive trainer statistics for all horses on
--  the race card. The Comprehensive Trainer Statistics File has a file
--  extension of .CT, or a name suffix of _t.
--
--  July 26, 2005 Added Primary Key
--  ALTER TABLE TrainerStats ADD PRIMARY KEY (RCTrack,RCDate,RCRace,Trainer,Category,Horse) ;

--  November 26, 2011 Changed size of ROI column from DECIMAL(4,2) to DECIMAL(5,2).
--  ALTER TABLE TrainerStats MODIFY ROI DECIMAL(5,2);
--  Got the following data: 
--  "HOL",11/24/2011,8,"Royal Pearl","Papaprodromou George","2Sprints/Rou",1,1.00,144.00

CREATE TABLE IF NOT EXISTS TrainerStats (
    RCTrack  CHAR(4),      -- Race Card Track
    RCDate   DATE,         -- Race Card Date
    RCRace   TINYINT,      -- Race Card Race
    Horse    VARCHAR(22),  -- Horse
    Trainer  VARCHAR(22),
    Category VARCHAR(12),  -- e.g. 2ndStart,Dirt,Routes,MdnClm
    Starts   INTEGER,
    WinPct   DECIMAL(4,2), -- Winning per centage
    ROI      DECIMAL(5,2), -- Return on investment(?)
  PRIMARY KEY (RCTrack,RCDate,RCRace,Trainer,Category,Horse),
          KEY (Trainer,Category)
);

-- Running Line File
--  This file contains running line level information for all horses on
--  the race card. The Running Line File has a file extension of .CHR,
--  or a name suffix of _hr.

CREATE TABLE IF NOT EXISTS RunningLine (

    RCTrack          CHAR(4),      -- Race Card Track
    RCDate           DATE,         -- Race Card Date
    RCRace           TINYINT,      -- Race Card Race
    Horse            VARCHAR(22),  -- Horse
    FD               CHAR(2),      -- Foreign or Domestic
    ForeignRace      CHAR,         -- Y=Yes
    DateofRace       DATE,         -- Date of race
    Track            CHAR(4),      -- Track name
    Race             TINYINT,      -- Race number
    Surface          CHAR(2),
    TimeformCode     CHAR,         -- speed rating outside N.A.
    InnerCode        CHAR(2),      -- Inner/outer/chute
    Distance         DECIMAL(6,2), -- Distance of race
    Class            CHAR(4),      -- Class of race
    LongClass        VARCHAR(14),
    ClaimPrice       DECIMAL(6,2),
    Purse            DECIMAL(8,3), -- In Thousands
    TrkCond          CHAR(4),      -- track condition
    RaceSex          CHAR(2),      -- Sex of race
    RaceAge          CHAR(2),      -- Age of race
    StateBred        CHAR(2),      -- State Bred race
    Starters         TINYINT,      -- Number of starters
    FirstFraction    DECIMAL(6,2), -- Fractional times are NOT expressed
    SecondFraction   DECIMAL(6,2), -- in seconds! e.g.,
    ThirdFraction    DECIMAL(6,2), -- 1:11 3/5 => 111.60
    FourthFraction   DECIMAL(6,2), -- 2:02 2/5 => 202.40
    FifthFraction    DECIMAL(6,2), -- i.e., the decimal parts are fifths of
    SixthFraction    DECIMAL(6,2), --       a second
    FinalTime        DECIMAL(6,2),
    FirstHorse       VARCHAR(22),
    SecondHorse      VARCHAR(22),
    ThirdHorse       VARCHAR(22),
    FirstWeight      INTEGER,      -- weights carried by each of the
    SecondWeight     INTEGER,      -- top three finishers
    ThirdWeight      INTEGER,
        
--      The <ordinal>LenAdj columns state the number of lengths by which the
--      horse was AHEAD of the horse behind it. The following rules apply
--      when the number of lengths is less than 1:
--          0.00 - 0.03  Dead Heat(?)
--          0.04 - 0.08  Nose
--          0.09 - 0.16  Head
--          0.17 - 0.35  Neck
--          0.15 - 0.35  1/4 length [conflict in Formulator 4 doc]
--          0.36 - 0.65  1/2 length
--          0.66 - 0.86  3/4 length
--          0.87 - 0.99  treat as 1 length
    FirstLenAdj      DECIMAL(6,2), -- the margins that separate each
    SecondLenAdj     DECIMAL(6,2), -- of the top three from the next
    ThirdLenAdj      DECIMAL(6,2), -- horse
    GradedRace       TINYINT,      -- American/Canadian Grade 1-3
    GradedRaceDesc   VARCHAR(46),
    ForeignCourse    CHAR,         -- L=Left Handed,R=RightHanded,S=Straight
    PostPosition     TINYINT,
        
--      The <ordinal>CallLenAdj columns correspond to the "lengths behind
--      the leader" values that will appear in [future?] PP lines
--      (as opposed to a Result Chart line) for this race.
--      Past Performance lines show the number of lengths BEHIND the leader
--      that a horse was, while Result Chart lines show the number of lengths
--      AHEAD of the following horse that this horse was.
    FirstCall        TINYINT,
    FirstCallLenAdj  DECIMAL(6,2),
    SecondCall       TINYINT,
    SecondCallLenAdj DECIMAL(6,2),
    ThirdCall        TINYINT,
    ThirdCallLenAdj  DECIMAL(6,2),
    FourthCall       TINYINT,
    FourthCallLenAdj DECIMAL(6,2),
    StrCall          TINYINT,
    StrCallLenAdj    DECIMAL(6,2),
    FinalCall        TINYINT,
    FinalCallLenAdj  DECIMAL(6,2),
        
    DQ               CHAR(2),      -- Disqualified
    DH               CHAR(2),      -- Dead Heat
    DQPlace          TINYINT,      -- Disqualified Placement
    Beyer            INTEGER,      -- Beyer Figure/Racing Post Ratings (Timeform Ratings)
    Weight           INTEGER,
    Apprentice       TINYINT,
    Comment          VARCHAR(22),
    LongComment      VARCHAR(72),
    Odds             DECIMAL(6,2),
    OddsPosition     TINYINT,
    Claimed          CHAR(2),
    Lasix            CHAR(2),
    Bute             CHAR(2),
    Blinker          CHAR(2),
    Bandage          CHAR(2),
    AltEquipment     CHAR(4),
    Jockey           VARCHAR(22),
    Trainer          VARCHAR(22),
    Entries          CHAR(2),
    TrackVariant     INTEGER,
    SpeedRating      INTEGER,
    Breed            CHAR(2),
    Owner            VARCHAR(36),
    DistUnit         CHAR(2),
    TimeUnit         CHAR(2),
    LoPrice          DECIMAL(6,2), -- Low Claiming Price in Thousands
    TrainYear        YEAR(4),
    TrainStarts      SMALLINT,
    TrainWins        SMALLINT,
    TrainPlaces      SMALLINT,
    TrainShows       SMALLINT,
    TrainWinPct      DECIMAL(6,2),
    SealedTrack      CHAR(1),
    PrevTrainYear    YEAR(4),
    PrevTrainStarts  SMALLINT,
    PrevTrainWins    SMALLINT,
    PrevTrainPlaces  SMALLINT,
    PrevTrainShows   SMALLINT,
    PrevTrainWinPct  DECIMAL(6,2),
    FirstFracHdths   DECIMAL(6,2), -- Note that the <ordinal>FracHdths columns
    SecondFracHdths  DECIMAL(6,2), --      correspond EXACTLY to the times 
    ThirdFracHdths   DECIMAL(6,2), --      that are shown in the Result Chart
    FourthFracHdths  DECIMAL(6,2),
    FifthFracHdths   DECIMAL(6,2),
    SixthFracHdths   DECIMAL(6,2),
    FinalTimeHdths   DECIMAL(6,2),
  PRIMARY KEY (RCTrack,RCDate,RCRace,Horse,DateofRace,Track),
          KEY (Horse,Track),
          KEY (Horse,DateofRace),
          KEY (Track,DateofRace,Race)
);

-- Horse File
--  This file contains entry level information for all horses on the race card,
--  as well as a "scratch indicator" for all scratched horses on the race card.
--  The Horse File has a file extension of .CH, or a name suffix of _h.

CREATE TABLE IF NOT EXISTS Horse (
    RCTrack              CHAR(4),        -- Race Card Track
    RCDate               DATE,           -- Race Card Date
    RCRace               TINYINT,        -- Race Card Race
    AeMto                CHAR(2),        -- Also Eligible/Main Track Only
    Weight               INTEGER,
    Horse                VARCHAR(22),    -- Horse
    FD                   CHAR(2),        -- Foreign or Domestic
    TripleCrown          CHAR(2),
    Sex                  CHAR(2),
    YBorn                INTEGER,        -- Year Born
    MBorn                TINYINT,        -- Month Born
    State                CHAR(6),        -- Country, if foreign horse
    Breeder              VARCHAR(58),
    Color                VARCHAR(12),
    Sire                 VARCHAR(22),
    SireSire             VARCHAR(22),    -- Sire's Sire
    Dam                  VARCHAR(22),
    DamSire              VARCHAR(22),    -- Dam's Sire
    Owner                VARCHAR(40),
    Sale                 CHAR(6),
    SaleYear             SMALLINT,
    SalePrice            DECIMAL(8,2),
    LastRaced            DATE,
    Bute                 CHAR(2),
    Lasix                CHAR(2),
    Blinker              CHAR(2),
    ClaimPrice           DECIMAL(6,2),   -- Claiming Price in Thousands
    Apprentice           CHAR(2),
    Jockey               VARCHAR(22),
    Trainer              VARCHAR(22),
    PostPosition         TINYINT,
    CYEarnings           DECIMAL(8,3),   -- Current Year Earnings in Thousands
    CYStarts             TINYINT,        -- Current Year Starts
    CYWins               TINYINT,
    CYPlaces             TINYINT,
    CYShows              TINYINT,
    PYEarnings           DECIMAL(8,3),   -- Previous Year Earnings in Thousands
    PYStarts             TINYINT,        -- Previous Year Starts
    PYWins               TINYINT,
    PYPlaces             TINYINT,
    PYShows              TINYINT,
    Earnings             DECIMAL(8,3),   -- Lifetime Earnings in Thousands
    Starts               SMALLINT,
    Wins                 SMALLINT,
    Places               SMALLINT,
    Shows                SMALLINT,
    WEarnings            DECIMAL(8,3),   -- Wet Earnings in Thousands
    WStarts              SMALLINT,
    WWins                SMALLINT,
    WPlaces              SMALLINT,
    WShows               SMALLINT,
    TEarnings            DECIMAL(8,3),   -- Turf Earnings in Thousands
    TStarts              SMALLINT,
    TWins                SMALLINT,
    TPlaces              SMALLINT,
    TShows               SMALLINT,
    DEarnings            DECIMAL(8,3),   -- Fast Dirt Earnings in Thousands
    DStarts              SMALLINT,
    DWins                SMALLINT,
    DPlaces              SMALLINT,
    DShows               SMALLINT,
    TrkEarnings          DECIMAL(8,3),   -- Track Earnings in Thousands
    TrkStarts            SMALLINT,
    TrkWins              SMALLINT,
    TrkPlaces            SMALLINT,
    TrkShows             SMALLINT,
    DistEarnings         DECIMAL(8,3),   -- Distance Earnings in Thousands
    DistStarts           SMALLINT,
    DistWins             SMALLINT,
    DistPlaces           SMALLINT,
    DistShows            SMALLINT,
    Entry                CHAR(2),        -- A=1st Entry,B=2nd Entry,C=3rd Entry
    JockMeetStarts       INTEGER,
    JockMeetEarnings     DECIMAL(8,3),   -- Jockey Meet Earnings in Thousands
    JockMeetWins         INTEGER,
    JockMeetPlaces       INTEGER,
    JockMeetShows        INTEGER,
    JockMeetWinPct       DECIMAL(4,2),   -- Jockey Meet Win Per cent
    JockMeetMoneyPct     DECIMAL(4,2),   -- Jockey Meet Money Per cent
    JockYTDStarts        INTEGER,        -- Jockey Year-to-Date starts
    JockYTDEarnings      DECIMAL(8,3),
    JockYTDWins          INTEGER,
    JockYTDPlaces        INTEGER,
    JockYTDShows         INTEGER,
    JockYTDWinPct        DECIMAL(4,2),   -- Jockey Year-to-Date Win Per cent
    JockYTDMoneyPct      DECIMAL(4,2),
    TrainerMeetStarts    INTEGER,
    TrainerMeetEarnings  DECIMAL(8,3),
    TrainerMeetWins      INTEGER,
    TrainerMeetPlaces    INTEGER,
    TrainerMeetShows     INTEGER,
    TrainerMeetWinPct    DECIMAL(4,2),
    TrainerMeetMoneyPct  DECIMAL(4,2),
    TrainerYTDStarts     INTEGER,
    TrainerYTDEarnings   DECIMAL(8,3),
    TrainerYTDWins       INTEGER,
    TrainerYTDPlaces     INTEGER,
    TrainerYTDShows      INTEGER,
    TrainerYTDWinPct     DECIMAL(4,2),
    TrainerYTDMoneyPct   DECIMAL(4,2),
    QtrStarts            SMALLINT,       -- Quarter Horse Starts
    QtrEarnings          DECIMAL(8,3),
    QtrWins              SMALLINT,
    QtrPlaces            SMALLINT,
    QtrShows             SMALLINT,
    EnteredTrack         CHAR(4),        -- Recently entered track
    EnteredDate          DATE,           -- Recently entered date
    EnteredRace          TINYINT,        -- Recently entered race
    StatsPriorYear       DATE,           -- Year of Career Box Prior Stats
    StudFee              DECIMAL(8,3),
    Scratch              CHAR(2),        -- Indicator Y=Yes N=NO
    JTTrackPeriod        CHAR(7),        -- yyyy-mm
    JTTrackStarts        SMALLINT,
    JTTrackEarnings      DECIMAL(6,2),
    JTTrackWinPct        DECIMAL(5,2),
    JTAllStarts          SMALLINT,
    JTAllWinPct          DECIMAL(5,2),
    JTAllRoi             DECIMAL(6,2),
  PRIMARY KEY (RCTrack,RCDate,RCRace,Horse)
);

-- Betting Information File
--  This file contains any late changes to information for the horses on the
--  race card, such as the official betting numbers, scratches, jockey changes,
--  and the morning line. The Betting Information File has a file extension of
--  .PGH, or a name suffix of _u.
--  Note that this file does not include scratched horses, but a scratch
--  indicator is set in the horse file record for all scratched horses.

CREATE TABLE IF NOT EXISTS BettingInfo (
    RCTrack      CHAR(4),      -- Race Card Track
    RCDate       DATE,         -- Race Card Date
    RCRace       TINYINT,
    ProgNum      CHAR(2),      -- Betting Number,
    PostPosition CHAR(2),
    Horse        VARCHAR(22),
    Jockey       VARCHAR(22),
    MLOdds       CHAR(5),      -- Morning Line Odds
  PRIMARY KEY (RCTrack,RCDate,RCRace,Horse,ProgNum)
);

--  This file contains Closer Look level information for all horses
--  in the race. The Closer Look File has a name suffix of _cl.

CREATE TABLE IF NOT EXISTS CloserLook (
    RCTrack  CHAR(4),
    RCDate   DATE,
    RCRace   TINYINT,
    Horse    VARCHAR(22),
    Comment  VARCHAR(8192),
  PRIMARY KEY (RCTrack, RCDate, RCRace, Horse)
);

--  This file contains Track Fact Trainer level information for the racecard.
--  The TrackFactTrainer File has a name suffix of _TF.

CREATE TABLE IF NOT EXISTS TrackFactTrainer (
    RCDate                     DATE,
    RCTrack                    CHAR(4),
    Trainer                    VARCHAR(22),
    Starts                     DECIMAL(5,2),
    Wins                       DECIMAL(5,2),
    Places                     DECIMAL(5,2),
    Shows                      DECIMAL(5,2),
    WinPercentage              DECIMAL(5,2),
    ITMPercentage              DECIMAL(5,2),
    AverageWinningPayoff       DECIMAL(5,2),
    SprintWins                 DECIMAL(5,2),
    SprintStarts               DECIMAL(5,2),
    RouteWins                  DECIMAL(5,2),
    RouteStarts                DECIMAL(5,2),
    TurfWins                   DECIMAL(5,2),
    TurfStarts                 DECIMAL(5,2),
    MainTrackWins              DECIMAL(5,2),
    MainTrackStarts            DECIMAL(5,2),
    MaidenAndClaimingWins      DECIMAL(5,2),
    MaidenAndClaimingStarts    DECIMAL(5,2),
    OtherWins                  DECIMAL(5,2),
    OtherStarts                DECIMAL(5,2),
    WinsLastThirtyDays         DECIMAL(5,2),
    StartsLastThirtyDays       DECIMAL(5,2),
    WinsLastTenDays            DECIMAL(5,2),
    StartsLastTenDays          DECIMAL(5,2),
  PRIMARY KEY (RCDate, RCTrack, Trainer)
);


--  This file contains Track Fact Jockey level information for the racecard.
--  The Track Fact Jockey File has a name suffix of _JF.

CREATE TABLE IF NOT EXISTS TrackFactJockey (
    RCDate                     DATE,
    RCTrack                    CHAR(4),
    Jockey                     VARCHAR(22),
    Starts                     DECIMAL(5,2),
    Wins                       DECIMAL(5,2),
    Places                     DECIMAL(5,2),
    Shows                      DECIMAL(5,2),
    WinPercentage              DECIMAL(5,2),
    ITMPercentage              DECIMAL(5,2),
    AverageWinningPayoff       DECIMAL(5,2),
    SprintWins                 DECIMAL(5,2),
    SprintStarts               DECIMAL(5,2),
    RouteWins                  DECIMAL(5,2),
    RouteStarts                DECIMAL(5,2),
    TurfWins                   DECIMAL(5,2),
    TurfStarts                 DECIMAL(5,2),
    MainTrackWins              DECIMAL(5,2),
    MainTrackStarts            DECIMAL(5,2),
    MaidenAndClaimingWins      DECIMAL(5,2),
    MaidenAndClaimingStarts    DECIMAL(5,2),
    OtherWins                  DECIMAL(5,2),
    OtherStarts                DECIMAL(5,2),
    WinsLastThirtyDays         DECIMAL(5,2),
    StartsLastThirtyDays       DECIMAL(5,2),
    WinsLastTenDays            DECIMAL(5,2),
    StartsLastTenDays          DECIMAL(5,2),
  PRIMARY KEY (RCDate, RCTrack, Jockey)
);


--  This file contains Track Fact Combo level information for the racecard.
--  The Track Fact Combo File has a name suffix of _CF.

CREATE TABLE IF NOT EXISTS TrackFactCombo (
    RCDate                     DATE,
    RCTrack                    CHAR(4),
    DateHeading                VARCHAR(128),
    Ordinal                    NUMERIC(3),
    JTCode                     ENUM('J', 'T'),
    Trainer                    VARCHAR(22),     -- this can be either a trainer or jockey name
    Starts                     DECIMAL(5,2),
    Wins                       DECIMAL(5,2),
    Places                     DECIMAL(5,2),
    Shows                      DECIMAL(5,2),
    AvgWinPayoff               DECIMAL(5,2),
  PRIMARY KEY (RCDate, RCTrack, Trainer, Ordinal)
);

-- ********************************************************************
-- Tables of Constants

CREATE TABLE IF NOT EXISTS AgeCodes (
    Code                        CHAR(2),
    Description                 VARCHAR(20),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS BreedTypeCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(18),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS InnerCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(30),
  PRIMARY KEY (Code)
);


CREATE TABLE IF NOT EXISTS BeatenLengths (
    Description                 CHAR(3),
    LowCode                     DECIMAL(3,2),
    HighCode                    DECIMAL(3,2),
    Comment                     VARCHAR(230),
  PRIMARY KEY (Description)
);

CREATE TABLE IF NOT EXISTS RaceTypeCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(16),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS RaceSexCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(20),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS EntrySexCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(24),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS SurfaceCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(40),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS TimeformCodes (
    Code                        CHAR(2) BINARY,
    Description                 VARCHAR(102),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS WorkoutSurfaceCodes (
    Code                        CHAR(1),
    Description                 VARCHAR(26),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS DirtTrackConditions (
    TrackCondition              CHAR(3),  -- Note: CONDITION is a MySQL reserved word
    Description                 CHAR(8),
    Explanation                 TEXT,
  PRIMARY KEY (TrackCondition)
);

CREATE TABLE IF NOT EXISTS TurfTrackConditions (
    TrackCondition              CHAR(3),  -- Note: CONDITION is a MySQL reserved word
    Description                 CHAR(10),
    Explanation                 TEXT,
  PRIMARY KEY (TrackCondition)
);

CREATE TABLE IF NOT EXISTS WorkoutSymbols (
    Symbol                      CHAR(4) BINARY,
    Description                 CHAR(24),
    KEY (Symbol)
)    CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS EquipmentSymbols (
    Symbol                      CHAR(1),
    Description                 VARCHAR(16),
  PRIMARY KEY (Symbol)
);

CREATE TABLE IF NOT EXISTS MedicationSymbols (
    Symbol                      CHAR(1),
    Description                 VARCHAR(18),
  PRIMARY KEY (Symbol)
);

-- Note this table is supposed to store symbols like
-- Dead-Heat and Disqualified. The only known source
-- for these symbols are glyphs in the PaddockV5 font.
-- We need to find a way to store these symbols in a table.
-- See page 153 of drf.pdf for a list of these symbols.
CREATE TABLE IF NOT EXISTS MiscellaneousSymbols (
    Symbol                      CHAR(2),
    Description                 VARCHAR(84)
);

-- The state names in this table are mixed-case.
-- If all upper case state names are needed,
-- use SELECT UPPER(Name) FROM StateNames
CREATE TABLE IF NOT EXISTS StateNames (
    Name                        VARCHAR(32),
    Abbrev                      CHAR(2),
  KEY (Name),
  KEY (Abbrev)
);

-- The country names in this table are mixed-case.
-- If all upper case country names are needed,
-- use SELECT UPPER(Name) FROM CountryNames
CREATE TABLE IF NOT EXISTS CountryNames (
    Name                        VARCHAR(24),
    Abbrev                      CHAR(3),
  KEY (Name),
  KEY (Abbrev)
);


-- The province names in this table are mixed-case.
-- If all upper case state names are needed,
-- use SELECT UPPER(Name) FROM CanadaProvNames
CREATE TABLE IF NOT EXISTS CanadaProvNames (
    Name                        VARCHAR(26),
    Abbrev                      CHAR(2),
  KEY (Name),
  KEY (Abbrev)
);


-- Textual descriptions of the most common types (classes) of races
CREATE TABLE IF NOT EXISTS RaceClassDefs (
    RaceClassCode               CHAR(4),
    RaceClassName               VARCHAR(128),
    Description                 TEXT,
  PRIMARY KEY (RaceClassCode),
          Key (RaceClassName)
);

-- ********************************************************************

-- International Race Track Table [UNDER DEVELOPMENT]
-- This table will evolve over time as more data is collected
-- (this is a first cut)
/*
CREATE TABLE IF NOT EXISTS InternationalTracks (

    TrackCode                              CHAR(4),
    TrackShortName                         VARCHAR(),
    TrackFullName                          VARCHAR(),
    StateName                              VARCHAR(),
    StateAbbrev                            CHAR(2),
    Province                               VARCHAR(),
    Country                                VARCHAR(),
    MajorTrack                             ENUM('Y'),
    TrainingCenter                         ENUM('Y'),
    JumpMeeting                            ENUM('Y'),
    ForeignTrackClass                      ENUM('A', 'B', 'C', 'D'),
    LessThanOneMileInCircumference         ENUM('Y'),
    AverageNetPurseValuePerRace1997        DECIMAL(10,3),   -- In thousands of dollars
    AverageNetPurseValuePerRace2007        DECIMAL(10,3),
    AverageNetPurseValuePerRace2008        DECIMAL(10,3),
    AverageNetPurseValuePerRace2009        DECIMAL(10,3),
    AverageNetPurseValuePerRace2010        DECIMAL(10,3),
    AverageNetPurseValuePerRace2011        DECIMAL(10,3),
    AverageNetPurseValuePerRace2012        DECIMAL(10,3),
    AverageNetPurseValuePerRace2013        DECIMAL(10,3),
    AverageNetPurseValuePerRace2014        DECIMAL(10,3),
    AverageNetPurseValuePerRace2015        DECIMAL(10,3),
    AverageNetPurseValuePerRace2016        DECIMAL(10,3),
    MainTrackCircumference                 DECIMAL(5,2),    -- In furlongs
    MainTrackSurface                       ENUM('Dirt', 'Synthetic', 'All-Weather', 'Sealed'),
    InnerTrackCircumference                DECIMAL(5,2),    -- In furlongs
    InnerTrackSurface                      ENUM('None', 'Dirt', 'Synthetic', 'All-Weather', 'Sealed'),
    NumberOfTurfCourses                    TINYINT(1),
    MainTurfCourseCircumference            DECIMAL(5,2),    -- In furlongs
    InnerTurfCourseCircumference           DECIMAL(5,2),
    ThirdTurfCourseCircumference           DECIMAL(5,2),
    MainTrackChute1                        SET(),           -- Distance(s) in furlongs that this chute allows 
    MainTrackChute2                        SET(),
    TurfCourseChute1                       SET(),
    TurfCourseChute2                       SET(),
    DistFromLastTurnToFinishMain           DECIMAL(5,2),    -- In feet
    DistFromLastTurnToFinishInner          DECIMAL(5,2),
    DistFromLastTurnToFinishMainTurf       DECIMAL(5,2),
    DistFromLastTurnToFinishInnerTurf      DECIMAL(5,2),
    DistFromLastTurnToFinishThirdTurf      DECIMAL(5,2),
    LiveRacingDays                         SET('Sun', 'Mon', 'Tues', 'Weds', 'Thurs', 'Fri', 'Sat'),
    RacingDates1Year                       YEAR(4),
    RacingDates1Start                      DATE,
    RacingDates2Year                       YEAR(4),
    RacingDates2Start                      DATE,
    RacingDates3Year                       YEAR(4),
    RacingDates3Start                      DATE,
    RacingDates4Year                       YEAR(4),
    RacingDates4Start                      DATE,
    TrackTakeoutWinPlaceShow               DECIMAL(4,2),    -- percentages
    TrackTakeoutWin                        DECIMAL(4,2),
    TrackTakeoutPlace                      DECIMAL(4,2),
    TrackTakeoutShow                       DECIMAL(4,2),
    TrackTakeoutWinPlaceShowDuringFairs    DECIMAL(4,2),
    TrackTakeoutAllExotic                  DECIMAL(4,2),    -- also "All others" variants
    TrackTakeoutAllExoticDuringFairs       DECIMAL(4,2),
    TrackTakeout2HorseExotics              DECIMAL(4,2),
    TrackTakeout3OrMoreHorseExotics        DECIMAL(4,2),
    TrackTakeoutDailyDouble                DECIMAL(4,2),    -- also Double
    TrackTakeoutExacta                     DECIMAL(4,2),    -- (also Perfecta, Exactor) select the first two horses in exact order
    TrackTakeoutQuinella                   DECIMAL(4,2),    -- Select the first two horses to finish in either order
    TrackTakeoutTrifecta                   DECIMAL(4,2),    -- (also Triactor) Select the first three horses in exact order
    TrackTakeoutTwinTrifecta               DECIMAL(4,2),    -- Pick the first three horses to cross the finish line in exact order
                                                            -- in both of two designated races.
    TrackTakeoutSuperfecta                 DECIMAL(4,2),    -- Select the first four horses in exact order
    TrackTakeoutGrandSlam                  DECIMAL(4,2),    -- Select a horse to finish either first, second or third in three
                                                            -- consecutive races and then the official winenr in the next race
    TrackTakeoutSuperHi5                   DECIMAL(4,2),    -- (also Super High 5) Pick the top 5 finishers in order in tody's
                                                            -- designated Super Hi-5 race
    TrackTakeoutPick3                      DECIMAL(4,2),    -- Pick 3, Pick Three, Pick-3, Win three,
    TrackTakeoutPick4                      DECIMAL(4,2),    -- Pick 4, Win 4, Win Four, Pick-4
    TrackTakeoutPick5                      DECIMAL(4,2),    -- Pick 5, Pick-5
    TrackTakeoutPick6                      DECIMAL(4,2),    -- Pick 6, Pick-6, Super 6
    TrackTakeoutPick6NonCarryover          DECIMAL(4,2),
    TrackTakeoutPick7                      DECIMAL(4,2),
    TrackTakeoutPick9                      DECIMAL(4,2),    -- Pick 9, Win Pick Nine
    MailingAddressName                     VARCHAR(),
    MailingAddressStreet                   VARCHAR(),
    MailingAddressState                    VARCHAR(),
    MailingAddressProvince                 VARCHAR(),
    MailingAddressZipCode                  CHAR(10),
    MailingAddressPostalCode               CHAR(10),
    MailingAddressCountry                  VARCHAR(),
    StreetAddressName                      VARCHAR(),
    StreetAddressStreet                    VARCHAR(),
    StreetAddressState                     VARCHAR(),
    StreetAddressProvince                  VARCHAR(),
    StreetAddressZipCode                   CHAR(10),
    StreetAddressPostalCode                CHAR(10),
    StreetAddressCountry                   VARCHAR(),
    Telephone1                             CHAR(16),
    Telephone2                             CHAR(16),
    TelephoneGeneralOffice                 CHAR(16),
    TelephoneGeneralInfo                   CHAR(16),
    TelephoneScratchLine                   CHAR(16),
    TelephoneResultsHotLine                CHAR(16),
    TelephoneAccountBetting                CHAR(16),
    TelephoneTABToll_FreeNumber            CHAR(16),
    TelephoneCreditCardDepositLine         CHAR(16),
    TelephonePressBox                      CHAR(16),
    TelephoneRacingOffice                  CHAR(16),
    TelephoneCorporate                     CHAR(16),
    TelephoneSwitchboard                   CHAR(16),
    TelephoneInformationLine               CHAR(16),
    TelephoneMain                          CHAR(16),
    TelephonePublicity                     CHAR(16),
    Fax                                    CHAR(16),
    FaxRacingOffice                        CHAR(16),
    FaxPublicity                           CHAR(16),
    FaxPressBox                            CHAR(16),
    FaxSimulcasting                        CHAR(16),
    FaxAdministration                      CHAR(16),
    Website                                VARCHAR(),
  PRIMARY KEY (TrackCode),
          KEY (TrackShortName)
);
*/
-- ********************************************************************

-- Summary of Formulator 4 Export Files

CREATE TABLE IF NOT EXISTS DataCounts (

    ExportName     CHAR(13),
    RCTrack        CHAR(4),
    RCDate         DATE,
    Early          CHAR     DEFAULT 'N',
    Final          CHAR     DEFAULT 'N',
    EarlyLineCount SMALLINT DEFAULT 0,
    FinalLineCount SMALLINT DEFAULT 0,
    Processed      CHAR     DEFAULT 'N',
    DBRowCount     SMALLINT DEFAULT 0,
  PRIMARY KEY (ExportName),
          KEY (RCTrack,RCDate)
);

 -- Par Times for each Track/Surface/Distance/Track Condition/Class/Sex/Age

 CREATE TABLE IF NOT EXISTS ParTimes (

    Track                    CHAR(4),       -- Track name
    StartDate                DATE,          -- earliest date that this par applies to
    EndDate                  DATE,          -- latest date that this par applies to
    Surface                  CHAR(2),
    Distance                 DECIMAL(6,2),  -- Distance of race
    TrkCond                  CHAR(4),       -- track condition
    RaceSex                  CHAR(2),       -- Sex of race
    RaceAge                  CHAR(2),       -- Age of race
    StateBred                CHAR(2),       -- State Bred race
    Class                    CHAR(4),       -- Class of race
    LongClass                VARCHAR(14),
    LowClaimingPrice         DECIMAL(6,2),
    HighClaimingPrice        DECIMAL(6,2),
    LowPurse                 DECIMAL(8,3),  -- In Thousands
    HighPurse                DECIMAL(8,3),  -- In Thousands
    LowClass                 VARCHAR(14),
    HighClass                VARCHAR(14),
    Grade                    TINYINT,       -- American/Canadian Grade 1-3

    NumberOfRaces            INTEGER,

      -- sums of times in seconds

    FirstFractSum            DECIMAL(8,2),
    SecondFractSum           DECIMAL(8,2),
    ThirdFractSum            DECIMAL(8,2),
    FourthFractSum           DECIMAL(8,2),
    FifthFractSum            DECIMAL(8,2),
    SixthFractSum            DECIMAL(8,2),
    FinalTimeSum             DECIMAL(8,2),

    FirstFractSumOfSquares   DECIMAL(9,2),
    SecondFractSumOfSquares  DECIMAL(9,2),
    ThirdFractSumOfSquares   DECIMAL(9,2),
    FourthFractSumOfSquare   DECIMAL(9,2),
    FifthFractSumOfSquares   DECIMAL(9,2),
    SixthFractSumOfSquares   DECIMAL(9,2),
    FinalTimeSumOfSquares    DECIMAL(9,2),

    FirstFractSumSquared     DECIMAL(9,2),
    SecondFractSumSquare     DECIMAL(9,2),
    ThirdFractSumSquared     DECIMAL(9,2),
    FourthFractSumSquare     DECIMAL(9,2),
    FifthFractSumSquared     DECIMAL(9,2),
    SixthFractSumSquared     DECIMAL(9,2),
    FinalTimeSumSquared      DECIMAL(9,2),

    FirstFractStdDev         DECIMAL(6,2),
    SecondFractStdDev        DECIMAL(6,2),
    ThirdFractStdDev         DECIMAL(6,2),
    FourthFractStdDev        DECIMAL(6,2),
    FifthFractStdDev         DECIMAL(6,2),
    SixthFractStdDev         DECIMAL(6,2),
    FinalTimeStdDev          DECIMAL(6,2),

    FirstFractPar            DECIMAL(6,2),
    SecondFractPar           DECIMAL(6,2),
    ThirdFractPar            DECIMAL(6,2),
    FourthFractPar           DECIMAL(6,2),
    FifthFractPar            DECIMAL(6,2),
    SixthFractPar            DECIMAL(6,2),
    FinalTimePar             DECIMAL(6,2),
  KEY (Track,StartDate,EndDate,Surface,Distance,TrkCond,RaceSex,RaceAge,StateBred,Class)
 );
