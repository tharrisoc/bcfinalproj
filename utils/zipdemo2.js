"use strict;"
var fs = require('fs');
var unzip = require('unzip');
var fstream = require('fstream');

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

// If you do not intend to consume an entry stream's raw data,
// call autodrain() to dispose of the entry's contents.
// Otherwise you risk running out of memory.

// Note that again, the documentation is wrong. It shows selection of a
// 'size' property, but there is no 'size' property in an Entry object.
/*
Entry {
  _readableState:
   ReadableState {
     highWaterMark: 16384,
     buffer: [],
     length: 0,
     pipes: null,
     pipesCount: 0,
     flowing: false,
     ended: false,
     endEmitted: false,
     reading: false,
     calledRead: false,
     sync: false,
     needReadable: true,
     emittedReadable: false,
     readableListening: false,
     objectMode: false,
     defaultEncoding: 'utf8',
     ranOut: false,
     awaitDrain: 0,
     readingMore: false,
     decoder: null,
     encoding: null },
  readable: true,
  domain: null,
  _events:
   { end: { [Function: bound onceWrapper] listener: [Function: onend] },
     finish: { [Function: bound onceWrapper] listener: [Function] } },
  _eventsCount: 2,
  _maxListeners: undefined,
  _writableState:
   WritableState {
     highWaterMark: 16384,
     objectMode: false,
     needDrain: false,
     ending: false,
     ended: false,
     finished: false,
     decodeStrings: true,
     defaultEncoding: 'utf8',
     length: 0,
     writing: false,
     sync: true,
     bufferProcessing: false,
     onwrite: [Function],
     writecb: null,
     writelen: 0,
     buffer: [],
     errorEmitted: false },
  writable: true,
  allowHalfOpen: true,
  _transformState:
   TransformState {
     afterTransform: [Function],
     needTransform: false,
     transforming: false,
     writecb: null,
     writechunk: null },
  props: { path: 'DelMar/2011-07-20/DMR110720Changes.txt' },
  path: 'DelMar/2011-07-20/DMR110720Changes.txt',
  type: 'File' }
*/
