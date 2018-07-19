/*
 *  Extract all of the files from a zip archive that contains
 *  previously-unpacked Formulator 4 data files.
 *  Create any necessary sub-directories, if they do not already 
 *  exist.
 *  The only command line argument is the path to the zip archive
 *  that is to be extracted from.
 */

"use strict;"

const zipUtils = require("./ziputils.js");

console.log(process.argv);

zipUtils.extractFormulator4FilesFromZip(process.argv[2], process.argv[3],
                                        process.argv[4]);


