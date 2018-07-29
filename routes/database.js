const express = require('express');
const passport = require('passport');
const ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn();
const router = express.Router();
const path= require("path");

console.log("We are at: " + __dirname);  // TWH DEBUG
db = require( __dirname + "/../app/models" );

// Retrieve all of the rows from the small RaceSexCodes table
router.get('/racesexcodes', ensureLoggedIn, function(req, res, next) {
    db.RaceSexCodes.findAll({}).then(function(results) {
        res.json(results);
    });
});

// Retrieve all of the rows from the small SurfaceCodes table
router.get('/surfacecodes', ensureLoggedIn, function(req, res, next) {
    db.SurfaceCodes.findAll({}).then(function(results) {
console.log(JSON.stringify());    // TWH DEBUG
        res.json(results);
    });
});





module.exports = router;
