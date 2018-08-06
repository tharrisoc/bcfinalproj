// This script serves html pages via handlebars templates

"use strict";

const express = require('express');
const passport = require('passport');
const ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn();
const router = express.Router();
const path= require("path");

const Sequelize = require("sequelize");
const Op = Sequelize.Op;

let db = require( __dirname + "/../app/models" );

// A GET route for displaying the data upload dialog box
router.get('/dataupload', ensureLoggedIn, function(req, res, next) {
  let data = {};
  db.NorthAmericanTracks.findAll({}).then(function(results) {
    data.tracksresults = results;
    let newList = equalizeTracks(data);
    data.tracksresults = newList;
    res.render('UploadDialog.handlebars',  
               { 'webPageTitle': 'Data Upload Dialog', data: data } );
  });  
});
  
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

// Give all of the TrackCodes a length of 3, and all of the Track Longnames
// the length of the longest Longname. This is done in order to attempt to
// display the data in columns in the <select> element.
function equalizeTracks(data) {
  let list = data.tracksresults;
  let maxLen = 0;
  let curLen;
  let curName;
  let curCode;
  let lenDiff;
  const spaces = "                                   ";
/*
  const spaces = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; */

  // list is an array of objects
  const numTracks = list.length;
  
  for (let i = 0; i < numTracks; i++) {
    curLen = list[i].LongName.length;
    if (curLen > maxLen) maxLen = curLen;
  }

  for (let i = 0; i < numTracks; i++) {
    curName = list[i].LongName;
    curLen  = curName.length;
    if (curLen < maxLen) {
      lenDiff = maxLen - curLen;
      curName = curName + spaces.substr(0, lenDiff);
      list[i].LongName = curName;
    }

    curCode = list[i].TrackCode;
    if (curCode.length < 3) {
      curCode = curCode + ' ';
      list[i].TrackCode = curCode;
    }
  }

  return list;
}

module.exports = router;
