const express = require('express');
const passport = require('passport');
const ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn();
const router = express.Router();
const path= require("path");

/* GET user profile. */
router.get('/', ensureLoggedIn, function(req, res, next) {
  res.send('You have reached the training page');
});

router.get('/dataupload', ensureLoggedIn, function(req, res, next) {
  res.sendFile( path.join(__dirname + '/../html/UploadDialog.html') );       // temporary path
});

router.get('/racereview', ensureLoggedIn, function(req, res, next) {
  res.render('rrtabletest.handlebars',  
             { 'webPageTitle': 'Race Review Format' } );
});

router.get('/criteriaselection', ensureLoggedIn, function(req,res,next) {
  res.render('criteriaselection.handlebars',
             { 'webPageTitle': 'Training Criteria Selection' } );
});

router.get('/criteriaform', ensureLoggedIn, function(req, res, next) {
  res.render('criteriaform.handlebars',
             { 'webPageTitle': 'Criteria Entry' } );
});

module.exports = router;
