// This script contains routes for all of the Formulator 4 database operations

"use strict";

const express = require('express');
const passport = require('passport');
const ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn();
const router = express.Router();
const path= require("path");

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

let db = require( __dirname + "/../app/models" );

// AGE CODES
// Retrieve all of the rows from the small AgeCodes table
router.get('/agecodes', ensureLoggedIn, function(req, res, next) {
    db.AgeCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small AgeCodes table
router.get('/agecodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.AgeCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// BEATEN LENGTHS
// Retrieve all of the rows from the small BeatenLengths table
router.get('/beatenlengths', ensureLoggedIn, function(req, res, next) {
    db.BeatenLengths.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small BeatenLengths table
// [ Note: some of the description codes contain a slash, e.g. 3/4 .
//         To specify these codes in a URL, substitute '&amp;&sol;' for '/']
router.get('/beatenlengths/:Description', ensureLoggedIn, function(req, res, next) {
    const entity = "&amp;&sol;";
    if (req.params.Description.indexOf(entity) > -1) {
      req.params.Description =
        req.params.Description.replace(entity, "/");
    }

    db.BeatenLengths.findOne({
        where: {
            Description: req.params.Description
          }
    }).then(function(results) {
        res.json(results);
    });
});


// BREED TYPE CODES
// Retrieve all of the rows from the small BreedTypeCodes table
router.get('/breedtypecodes', ensureLoggedIn, function(req, res, next) {
    db.BreedTypeCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small BreedTypeCodes table
router.get('/breedtypecodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.BreedTypeCodes.findOne({
        where: {
          Code: req.params.Code
        }
    }).then(function(results) {
        res.json(results);
    });
});


// CANADA PROVINCE NAMES
// Retrieve all of the rows from the small CanadaProvNames table
router.get('/canadaprovnames', ensureLoggedIn, function(req, res, next) {
    db.CanadaProvNames.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve the abbreviation for a province from the small CanadaProvNames table
// [Note: if the name contains spaces, e.g. Prince Edward Island,
//        substitute %20 for each space, i.e. Prince%20Edward%20Island]
router.get('/canadaprovnames/:Name', ensureLoggedIn, function(req, res, next) {
    db.CanadaProvNames.findOne({
        where: {
            Name: req.params.Name
          }
    }).then(function(results) {
        res.json(results);
    });
});


// COUNTRY NAMES
// Retrieve all of the rows from the small CountryNames table
router.get('/countrynames', ensureLoggedIn, function(req, res, next) {
    db.CountryNames.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve the abbreviation for a country from the small CountryNames table
// [Note: if the name contains spaces, e.g. Czech Republic,
//        substitute %20 for each space, i.e. Czech%20Republic]
router.get('/countrynames/:Name', ensureLoggedIn, function(req, res, next) {
    db.CountryNames.findOne({
        where: {
            Name: req.params.Name
          }
    }).then(function(results) {
        res.json(results);
    });
});


// DIRT TRACK CONDITIONS
// Retrieve all of the rows from the small DirtTrackConditions table
router.get('/dirttrackconditions', ensureLoggedIn, function(req, res, next) {
    db.DirtTrackConditions.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small DirtTrackConditions table
router.get('/dirttrackconditions/:TrackCondition', ensureLoggedIn, function(req, res, next) {
    db.DirtTrackConditions.findOne({
        where: {
            TrackCondition: req.params.TrackCondition
          }
    }).then(function(results) {
        res.json(results);
    });
});


//ENTRY SEX CODES
// Retrieve all of the rows from the small EntrySexCodes table
router.get('/entrysexcodes', ensureLoggedIn, function(req, res, next) {
    db.EntrySexCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small EntrySexCodes table
router.get('/entrysexcodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.EntrySexCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// EQUIPMENT SYMBOLS
// Retrieve all of the rows from the small EquipmentSymbols table
router.get('/equipmentsymbols', ensureLoggedIn, function(req, res, next) {
    db.EquipmentSymbols.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small EquipmentSymbols table
router.get('/equipmentsymbols/:Symbol', ensureLoggedIn, function(req, res, next) {
    db.EquipmentSymbols.findOne({
        where: {
            Symbol: req.params.Symbol
          }
    }).then(function(results) {
        res.json(results);
    });
});


// INNER CODES
// Retrieve all of the rows from the small InnerCodes table
router.get('/innercodes', ensureLoggedIn, function(req, res, next) {
    db.InnerCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small InnerCodes table
router.get('/innercodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.InnerCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// MEDICATION SYMBOLS
// Retrieve all of the rows from the small MedicationSymbols table
router.get('/medicationsymbols', ensureLoggedIn, function(req, res, next) {
    db.MedicationSymbols.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small MedicationSymbols table
router.get('/medicationsymbols/:Symbol', ensureLoggedIn, function(req, res, next) {
    db.MedicationSymbols.findOne({
        where: {
            Symbol: req.params.Symbol
          }
    }).then(function(results) {
        res.json(results);
    });
});


// MISCELLANEOUS SYMBOLS
// [Note: there are no miscellaneous symbols yet]
// Retrieve all of the rows from the small MiscellaneousSymbols table
router.get('/miscellaneoussymbols', ensureLoggedIn, function(req, res, next) {
    db.MiscellaneousSymbols.findAll({}).then(function(results) {
        res.json(results);
    });
});


// NORTH AMERICAN TRACKS
// Retrieve all of the rows from the small northamericantracks table
router.get('/northamericantracks', ensureLoggedIn, function(req, res, next) {
    db.NorthAmericanTracks.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small northamericantracks table
router.get('/northamericantracks/:TrackCode', ensureLoggedIn, function(req, res, next) {
    db.NorthAmericanTracks.findOne({
        where: {
          TrackCode: { [Op.like]: req.params.TrackCode }
        }
    }).then(function(results) {
        res.json(results);
    });
});


// RACE CLASS DEFS
// Retrieve all of the rows from the small RaceClassDefs table
router.get('/raceclassdefs', ensureLoggedIn, function(req, res, next) {
    db.RaceClassDefs.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small RaceClassDefs table
router.get('/raceclassdefs/:RaceClassCode', ensureLoggedIn, function(req, res, next) {
    db.RaceClassDefs.findOne({
        where: {
          RaceClassCode: { [Op.like]: req.params.RaceClassCode }
        }
    }).then(function(results) {
        res.json(results);
    });
});


// RACE SEX CODES
// Retrieve all of the rows from the small RaceSexCodes table
router.get('/racesexcodes', ensureLoggedIn, function(req, res, next) {
    db.RaceSexCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small RaceSexCodes table
router.get('/racesexcodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.RaceSexCodes.findOne({
        where: {
          Code: req.params.Code
        }
    }).then(function(results) {
        res.json(results);
    });
});


// RACE TYPE CODES
// Retrieve all of the rows from the small RaceTypeCodes table
router.get('/racetypecodes', ensureLoggedIn, function(req, res, next) {
    db.RaceTypeCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small RaceTypeCodes table
router.get('/racetypecodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.RaceTypeCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// STATE NAMES
// Retrieve all of the rows from the small StateNames table
router.get('/statenames', ensureLoggedIn, function(req, res, next) {
    db.StateNames.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve the abbreviation for a state from the small StateNames table
// [Note: if the name contains spaces, e.g. Rhode Island,
//        substitute %20 for each space, i.e. Rhoad%20Island]
router.get('/statenames/:Name', ensureLoggedIn, function(req, res, next) {
    db.StateNames.findOne({
        where: {
            Name: req.params.Name
          }
    }).then(function(results) {
        res.json(results);
    });
});


// SURFACE CODES
// [Note: the row for "Simulcast, Cancelled, Non Thoroughbred" was
//        removed from the table because its code was a backslash (\)
//        which cannot serve as a key in a JavaScript object.]
// Retrieve all of the rows from the small SurfaceCodes table
router.get('/surfacecodes', ensureLoggedIn, function(req, res, next) {
    db.SurfaceCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small SurfaceCodes table
router.get('/surfacecodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.SurfaceCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// TIMEFORM CODES
// Retrieve all of the rows from the small TimeformCodes table
router.get('/timeformcodes', ensureLoggedIn, function(req, res, next) {
    db.TimeformCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small TimeformCodes table
router.get('/timeformcodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.TimeformCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// TURF TRACK CONDITIONS
// Retrieve all of the rows from the small TurfTrackConditions table
router.get('/turftrackconditions', ensureLoggedIn, function(req, res, next) {
    db.TurfTrackConditions.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small TurfTrackConditions table
router.get('/turftrackconditions/:TrackCondition', ensureLoggedIn, function(req, res, next) {
    db.TurfTrackConditions.findOne({
        where: {
            TrackCondition: req.params.TrackCondition
          }
    }).then(function(results) {
        res.json(results);
    });
});


// WORKOUT SURFACE CODES
// Retrieve all of the rows from the small WorkoutSurfaceCodes table
router.get('/workoutsurfacecodes', ensureLoggedIn, function(req, res, next) {
    db.WorkoutSurfaceCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small WorkoutSurfaceCodes table
router.get('/workoutsurfacecodes/:Code', ensureLoggedIn, function(req, res, next) {
    db.WorkoutSurfaceCodes.findOne({
        where: {
            Code: req.params.Code
          }
    }).then(function(results) {
        res.json(results);
    });
});


// WORKOUT SYMBOLS
// Retrieve all of the rows from the small WorkoutSymbols table
router.get('/workoutsymbols', ensureLoggedIn, function(req, res, next) {
    db.WorkoutSymbols.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve one row from the small WorkoutSymbols table
router.get('/workoutsymbols/:Symbol', ensureLoggedIn, function(req, res, next) {
    db.WorkoutSymbols.findOne({
        where: {
            Symbol: req.params.Symbol
          }
    }).then(function(results) {
        res.json(results);
    });
});

module.exports = router;
