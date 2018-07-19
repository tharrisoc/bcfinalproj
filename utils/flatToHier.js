// Distribute a collection of Formulator 4 Files that originte in a
// flat file system to a hierarchical file system based on 
//     <root>/<track abbreviation>/<race date>

// Note: the 'sync' versions of fs utilities are used here because
//       this script is part of offline processing. It is not to
//       be used during live on-line operations -- it is part of
//       the Formulator 4 database setup.

"use strict;"
var fs = require('fs');
var fse = require('fs-extra');  // this is a superset of fs [npm install fs-extra]
var mysql = require('mysql');

const flatOrganization      = "C:/Users/Public/Documents/racedata/flat";
const hierarchyOrganization = "C:/Users/Public/Documents/racedata/csvfiles";

let   fileNames = fs.readdirSync(flatOrganization);
const fileCount = fileNames.length;
var   filesMoved = 0;

const fileRegex = 
  /([A-Z]{2,3})_?([0-9]{2})([0-9]{2})([0-9]{2})(_?[a-z]{1,2})?\.((?:txt|csv|chr|ch|cr|cs|ct|cw|pgh))/i;

let con = mysql.createConnection({
	host:     "localhost",
	user:     "tharris",
	password: "J2MeDev",
	database: "racingform" }
);

con.connect( function(err) {
	if (err) throw err;
	console.log("Connected!");
});

console.log("A total of " + fileCount + " file names were read from");
console.log(flatOrganization);

fileNames.forEach(moveFile);

console.log("A total of " + filesMoved + " files were moved");
process.exit(0);

function moveFile(element) {
	var fileParts = element.match(fileRegex);
//  console.log(fileParts) ;  // DEBUG
//  console.log(fileParts.length);  // DEBUG

	if(fileParts && (fileParts.length >= 7)) {
		let   track = fileParts[1];
		const year  = fileParts[2];
		const month = fileParts[3];
		const day   = fileParts[4];

		// The first letter of the TrackCode should be uppercase.
		// [Note: the case of letters in the TrackCodes is inconsistent
		//        e.g. AP ATO Alb ArP DeD Del, etc.]
        track = track.charAt(0).toUpperCase() + track.substr(1);
        fileParts[1] = track;

        // Create an all uppercase version to compare with the value
        // that is retrieved from the database
        let upperTrack = track.toUpperCase();

//      console.log( track + "   " + upperTrack);   // DEBUG

	    const checkTrackQuery = 
	        "SELECT * FROM NorthAmericanTracks WHERE UPPER(TrackCode) = '" + upperTrack + "'";

//      console.log(checkTrackQuery);   // DEBUG

        /* This code requires additional debugging
	    con.query(checkTrackQuery, function(err, result) {
	      if (err) { console.log("An error occurred."); throw err; }
	      console.log("Result: " + JSON.stringify(result) + "   " + (typeof result) )  // DEBUG
	      // result is an array of (1) objects
	      if (result.length == 1) {
	      	doTheRename(fileParts);
	      } else {
	      	console.log( "Unrecognized TrackCode: '" + track + "'");
	      }

	    });
        */

        // Unconditionally move the files
        doTheRename(fileParts);
	} else {
		console.log("Unrecognized file name: " + element);
		process.exit(1);
	}
}

function doTheRename(fileParts) {
    const oldPath = flatOrganization + '/' + fileParts[0];
    let newPath = hierarchyOrganization + '/' + fileParts[1];
    const subDir  = '20' + fileParts[2] + '-' + fileParts[3] + '-' +    fileParts[4];
    newPath += ('/' + subDir);
    console.log("ensureDirSync: " + newPath);   // DEBUG
    fse.ensureDirSync(newPath);
    newPath += ('/' + fileParts[0]);
    // make sure that this is not a duplicate
    if (!fse.pathExistsSync(newPath)) {
      console.log("moveSync");   // DEBUG
      fse.moveSync(oldPath, newPath);
      ++filesMoved;
      console.log("From: " + oldPath);     // DEBUG
      console.log("To:   " + newPath);     // DEBUG
    } else {
      console.log("File already moved: " + newPath);    	
    }
}

// fs.renameSync(oldpath, newpath) returns undefined
// var files = fs.readdirSync(<path>)
//           returns An array of filenames excluding '.' and '..'
// fse.ensureDirSync(dir)  ensures that the directory exists.
//           If the directory does not exist, it is created.
// fse.moveSync(src, dest,  { overwrite: true })
//           Moves a file or directory, even across devices
// fse.pathExistsSync(file)  returns true if the path exists, false otherwise

// Result is an array of (1) objects

// Result: [{"TrackCode":"Hol","ShortName":"Hollywood Park","LongName":"Hollywood Park","State":"CA"}]   object

/*
[ 'Hol110513_CF.csv',
  'Hol',
  '11',
  '05',
  '13',
  '_CF',
  'csv',
  index: 0,
  input: 'Hol110513_CF.csv' ]
*/
