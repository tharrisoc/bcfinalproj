// This is simple sample code for uploading a file that shows just the
// bare essentials.

// The two input arguments are the path to the directory where the uploaded
// files should be stored and the port that the app should listen to for
// incoming requests.

// Require/import the HTTP module
var http = require("http");

// This module is useful for parsing form data, especially file uploads.
var formidable = require('formidable');

var fs = require('fs');
var fse = require('fs-extra');  // this is a superset of fs

// The port to listen on for incoming requests
var PORT;

// The folder where the uploaded files should be stored
var destinationFolder; 

if ( (PORT === undefined) || (destinationFolder === undefined) ) {
  validateCmdLineArgs();
}

// Create a generic function to handle requests and responses
function handleRequest(request, response) {

  // Perform the following processing when the user visits the PORT URL
  if (request.url == '/fileupload') {
  	var form = new formidable.IncomingForm();
  	form.parse(request, function(err, fields, files) {
      var oldpath      = files.filetoupload.path;
      var originalName = files.filetoupload.name;
      if (destinationFolder.charAt(destinationFolder.length-1) !== '/') {
        destinationFolder += '/';
      }
      var newpath =  destinationFolder + originalName;

console.log("'" + PORT + "' '" + oldpath + "' '" + newpath + "'");  // DEBUG
      fs.rename(oldpath, newpath, function(err) {
      	if (err) throw err;
      	response.write('File uploaded and moved!');
      	response.end();
      });
  	});
  } else {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write('<form action="fileupload" method="post" enctype="multipart/form-data">');
    response.write('<input type="file" name="filetoupload"><br>');
    response.write('<input type="submit">');
    response.write('</form>');
    return response.end();
  }
}

// Use the Node HTTP package to create our server.
// Pass the handleRequest function to empower it with functionality.
var server = http.createServer(handleRequest);

// Start our server so that it can begin listening to client requests.
server.listen(PORT, function() {

  // Log (server-side) when our server has started
  console.log("Server listening on: http://localhost:" + PORT);
});

function validateCmdLineArgs() {
  if (process.argv.length < 4) usage();
  
  if ( /^\d+$/.test(process.argv[3]) ) {
    PORT = parseInt(process.argv[3], 10);
    if ( !( (PORT >= 1024) && (PORT <= 49151) ) ) {
      usage();
    }
  }
  else {
    usage();
  }

  destinationFolder = process.argv[2];

  fse.ensureDirSync(destinationFolder);

  fs.stat(destinationFolder, function(err, stats) {
    console.log(destinationFolder);
    console.log();
    console.log(stats);
    console.log();

    if (stats.isFile()) {
      console.log('    file');
    }
    if (stats.isDirectory()) {
      console.log('    directory');
    }

    console.log('    others Write:   ' + (stats["mode"] & 2 ? 'w' : '-'));
    console.log('    others Read:    ' + (stats["mode"] & 4 ? 'r' : '-'));

    console.log('    group Write:    ' + (stats["mode"] & 20 ? 'w' : '-'));
    console.log('    group Read:     ' + (stats["mode"] & 40 ? 'r' : '-'));

    console.log('    owner Write:    ' + (stats["mode"] & 200 ? 'w' : '-'));
    console.log('    owner Read:     ' + (stats["mode"] & 400 ? 'r' : '-'));

    if ( !(stats["mode"] & 200) || !(stats["mode"] & 400) ) {
      console.log('The owner of this applicaton cannot both READ and WRITE'
                + ' to the destination directory.');
      process.exit(-1);
    }
  });

}

function usage() {
  console.log("Usage is: node fileUploadTest.js <destination folder> <port number> (1024 >= port <= 49151)");
  process.exit(-1);
}
