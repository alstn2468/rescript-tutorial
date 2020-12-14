/* Variable
 * Rescript's variable is convert to object that having contents attribute
 */
let x = 5 // const x = 5;
let x = ref(5); x:= x.contents + 1 // let x = 5; x = x + 1;


/* String & Character
 * Rescript's string must use double quote
 * ReScript can use template literal same with Javascript's syntax
 */
let str = "Hello world!"
// let str = 'Hello world!' -> syntax error (string must use double quote)
let str = "Hello " ++ "world!" // "Hello " + "world"
let message = "world!"
let str = `Hello ${message}` // Same with Javascript's template literal

/* Boolean
 * Rescript has same boolean type with Javascript
 * Rescript's ==, != operators are deep equality operator not equality operator with implicit casting 
 */
let thisIsTrue = true
let thisIsFalse = false
let thisIsFalseTwo = !true
let orOperator = true || false
let andOperator = true || true
let greaterThanOrEqualToOperator = 5 >= 1
let lessThanOrEqualToOperator = 1 <= 5
let lessThanOperator = 1 < 5
let greaterThanOperator = 5 > 1
let equalOperator = 1 === 1
let notEqualOperator = 1 !== 2
let deepEqualityOperator = 1 == 1
let deepNotEqaulOperator = 1 != 2