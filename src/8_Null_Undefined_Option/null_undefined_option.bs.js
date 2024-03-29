// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Caml_option = require("bs-platform/lib/js/caml_option.js");
var ConstantJs = require("./constant.js");
var ValidatorJs = require("./validator.js");

var licenseNumber1 = 5;

var licenseNumber2;

if (licenseNumber1 !== undefined) {
  console.log("The person's license number is " + licenseNumber1.toString());
} else {
  console.log("The person doesn't have a car");
}

var myId = ConstantJs.myId;

var myId2 = ConstantJs.myId2;

console.log(myId);

console.log(myId2);

function validate(prim) {
  return ValidatorJs.validate(prim);
}

var personId = "abc123";

var result = ValidatorJs.validate(personId);

console.log(result);

var licenseNumber = 5;

var personHasACar = false;

var x = Caml_option.some(undefined);

exports.licenseNumber = licenseNumber;
exports.licenseNumber1 = licenseNumber1;
exports.personHasACar = personHasACar;
exports.licenseNumber2 = licenseNumber2;
exports.x = x;
exports.myId = myId;
exports.myId2 = myId2;
exports.validate = validate;
exports.personId = personId;
exports.result = result;
/*  Not a pure module */
