// This script serves html pages through handlebars templates

"use strict";

const express = require('express');
const passport = require('passport');
const ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn();
const router = express.Router();
const path= require("path");

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

let db = require( __dirname + "/../app/models" );

router.get('/abbrevs', ensureLoggedIn, function(req, res, next) {
  let data = {};
  db.AgeCodes.findAll({}).then(function(results) {
   data.ageresults = results;
   db.BeatenLengths.findAll({}).then(function(results) {
    data.beatenresults = results;
     db.BreedTypeCodes.findAll({}).then(function(results) {
      data.breedtyperesults = results;
      db.DirtTrackConditions.findAll({}).then(function(results) {
       data.dirtcondresults = results;
       db.EntrySexCodes.findAll({}).then(function(results) {
        data.entrysexcoderesults = results;
        db.EquipmentSymbols.findAll({}).then(function(results) {
         data.equipmentresults = results;
         db.InnerCodes.findAll({}).then(function(results) {
          data.innercoderesults = results;
          db.MedicationSymbols.findAll({}).then(function(results) {
           data.medsymresults = results;
           db.RaceClassDefs.findAll({}).then(function(results) {
            data.classdefresults = results;
            db.RaceSexCodes.findAll({}).then(function(results) {
             data.racesexdataresults = results;
             db.RaceTypeCodes.findAll({}).then(function(results) {
              data.racetypecoderesults = results;
              db.SurfaceCodes.findAll({}).then(function(results) {
               data.surfacecoderesults = results;
               db.TimeformCodes.findAll({}).then(function(results) {
                data.timeformratingresults = results;
                db.TurfTrackConditions.findAll({}).then(function(results) {
                 data.turftrackconditionresults = results;
                 db.WorkoutSurfaceCodes.findAll({}).then(function(results) {
                  data.workoutsurfacecoderesults = results;
                  db.WorkoutSymbols.findAll({}).then(function(results) {
                   data.workoutsymbolresults = results;
                   res.render('abrsympage.handlebars',
                   { 'webPageTitle': 'Abbreviation &amp; Symbol Tables', data: data } );
                  });
                 });
                });
               });
              });
             });
            });
           });
          });
         });
        });
       });
      });
     });
   });
  });
});

router.get('/locations', ensureLoggedIn, function(req, res, next) {
  let data = {};
  db.StateNames.findAll({}).then(function(results) {
    data.stateresults = results;
    db.NorthAmericanTracks.findAll({}).then(function(results) {
      data.tracksresults = results;
      db.CanadaProvNames.findAll({}).then(function(results) {
        data.provinceresults = results;
        db.CountryNames.findAll({}).then(function(results) {
          data.countryresults = results;
          res.render('geographypage.handlebars',  
          { 'webPageTitle': 'Geography Tables', data: data } );
        });
      });
    });
  });
});

/*


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

*/

module.exports = router;
