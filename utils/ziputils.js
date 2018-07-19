"use strict;"
const fs = require('fs');
var unzip = require('unzip');
//var fstream = require('fstream');
var path = require('path');
var normalize = require('normalize-path');

const fileRegex = 
  /([A-Z]{2,3})_?([0-9]{2})([0-9]{2})([0-9]{2})(_?[a-z]{1,2})\.((?:txt|csv|chr|ch|cr|cs|ct|cw|pgh))/i;

var extractFormulator4FilesFromZip = 
    function(zipFile, targetDirectory, drillDownPath) {
        // create a hierarchy that looks like:
        // <targetDirectory>/<track abbrev>/<YYYY-MM-DD>/
        // This code assumes that once the optional drillDownPath has
        // been taken into account, all of the files are in a single
        // subdirectory of the zip archive

console.log("zip:   " + zipFile);
console.log("targ:  " + targetDirectory);
console.log("drill: '" + drillDownPath + "'"); 

        var rootDirectory = 
            ((drillDownPath !== null) && (drillDownPath !== undefined)
          && (drillDownPath !== '')) ? drillDownPath + '/' : '' ;
        rootDirectory = normalize(rootDirectory);

        targetDirectory = normalize(targetDirectory);

        zipFile = normalize(zipFile);
        console.log("Zip exists? " + fs.existsSync(zipFile));

        // Collect the lines that are to be written to the log in an
        // array and output the entire array to the stream at once.
        // TODO: this is a very inefficient use of memory, but I have not
        //       yet found a way to write each line to the stream at the
        //       time that the line is created.
        let logLines = [];
        let stream = fs.createWriteStream('./log.txt');
        let errOccurred = false;

console.log('Creating Promise: ' + zipFile);  //DEBUG
        var promise = new Promise(function(resolve, reject) {
          // Process each zip file entry (our "do a thing, possibly async")
          fs.createReadStream(zipFile)
               .pipe(unzip.Parse())
               .on('entry', function(entry) {
                   var fileName = entry.path;
                   var type = entry.type;   // 'Directory' or 'File'
                   if (type === 'File') {
                     var fileParts = fileName.match(fileRegex);
                     if(fileParts) {
                       logLines.push(JSON.stringify(fileParts));
                     } else {
                       logLines.push("Unrecognized file name: " + fileName);
                     }
                   } else if (type === 'Directory') {
                     logLines.push("Skipping folder: " + fileName);
                   } else {
                      logLines.push("Error: Unknown file type " + fileName);
                      errOccurred = true;
                   }
               });

          if (!errOccurred) {
            resolve('Stuff worked! (' + logLines.length + ')');
          } else {
            reject('It broke');
          }
        });

console.log("Invoking promise");  // DEBUG
        promise.then(function(result) {
          for (let i = 0; i < logLines.length; i++) {
            stream.write(logLines[i] + "\n");
          }

          stream.end();
          console.log(result);
        }, function(err) {
             console.log(err);
        });

    };

// https://stackoverflow.com/questions/13696148/node-js-create-folder-or-use-existing
var createDirectory =
    function(pathToDirectory) {
        const directory = normalize(pathToDirectory);

        return new Promise((resolve, reject) => {
        	fs.stat(directory, (error) => {
        		if (error) {
        			if (error.code ==='ENOENT') {
        				fs.mkdir(directory, (error) => {
        					if (error) {
        						reject(error);
        					} else {
        						resolve(directory);
        					}
        				});
        			} else {
        			    reject(error)
                    }
        		} else {
        			resolve(directory);
        		}
        	});
        });
    };

module.exports = {
    createDirectory : createDirectory,
    extractFormulator4FilesFromZip: extractFormulator4FilesFromZip
}

/*

//      console.log(fileName + ' ' + type);  //DEBUG

        if (fileName === "DelMar/2011-07-30/Dmr110730_t.csv") {
            console.log("Found the file");
            entry.pipe(fs.createWriteStream("C:\\Users\\tom\\Documents\\tmp\\tmp\\Dmr110730_t.csv"));
        }
        else {
            entry.autodrain();
        } 


// Extract all of the files in an archive
fs.createReadStream("C:\\Users\\Public\\Documents\\racedata\\DelMarSummer2011Folders.zip")
   .pipe(unzip.Extract({ path: "C:\\Users\\tom\\Documents\\tmp\\tmp"}));

// Parse zip file contents
// Process each zip file entry
fs.createReadStream("C:\\Users\\Public\\Documents\\racedata\\DelMarSummer2011Folders.zip")
    .pipe(unzip.Parse())
    .on('entry', function(entry) {
    	var fileName = entry.path;
    	var type = entry.type;   // 'Directory' or 'File'
//    	var size = entry.size;      Unfortunately, there is no size
    	console.log(fileName + ' ' + type);  //DEBUG

        if (fileName === "DelMar/2011-07-30/Dmr110730_t.csv") {
        	console.log("Found the file");
        	entry.pipe(fs.createWriteStream("C:\\Users\\tom\\Documents\\tmp\\tmp\\Dmr110730_t.csv"));
        }
        else {
        	entry.autodrain();
        }
    });

// Pipe entries to another stream
var readStream  = fs.createReadStream("C:\\Users\\Public\\Documents\\racedata\\DelMarSummer2011Folders.zip");
var writeStream = fstream.Writer('C:\\Users\\tom\\Documents\\tmp\\tmp');

readStream
    .pipe(unzip.Parse())
    .pipe(writeStream);

*/
