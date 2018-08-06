"use strict";

$(document).ready(readyFunc);

function readyFunc() {
console.log("Enter readyFunc()");  // TWH DEBUG

// leave this here for now as an example of how to write code of this type
/*
  $("#geogtables").on( "click", populateGeogTables);
  $("#absymtables").on("click", populateAbbrevTables);
*/
}

/*
let data;

function populateGeogTables() {
  data = {};
  $.ajax({
  	  method: "GET",
  	  url: "/database/statenames",
  	  dataType: "json",
//  	  encode: true
  }).then(function(result) {
      data.stateresults = result;
      $.ajax({
  	    method: "GET",
  	    url: "/database/northamericantracks",
  	    dataType: "json",
//  	    encode: true
      }).then(function(result) {
      	data.tracksresults = result;
      	$.ajax({
  	      method: "GET",
  	      url: "/database/canadaprovnames",
  	      dataType: "json",
//  	    encode: true
      	}).then(function(result) {
          data.provinceresults = result;
          $.ajax({
  	      method: "GET",
  	      url: "/database/countrynames",
  	      dataType: "json",
//  	    encode: true
          }).then(function(result) {
          	data.countryresults = result;
console.log('data:');  // TWH DEBUG
console.log('stateresults:');  // TWH DEBUG
console.log(data.stateresults);  // TWH DEBUG
console.log('tracksresults');  // TWH DEBUG
console.log(data.tracksresults);  // TWH DEBUG
console.log('provinceresults');  // TWH DEBUG
console.log(data.provinceresults);  // TWH DEBUG
console.log('countryresults');  // TWH DEBUG
console.log(data.countryresults);  // TWH DEBUG
          })
      	})
      })
  })
}
*/
