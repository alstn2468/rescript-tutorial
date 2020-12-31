/* Array
 * Array는 ReScript에서 기본적으로 정렬된 자료구조다.
 * JavaScript의 배열과 동일한 방식으로 동작한다.
 * ReScript의 배열의 각 항목은 타입이 동일해야 한다.
 * Js.Array API를 보면된다.
 * https://rescript-lang.org/docs/manual/latest/api/js/array
 * Array의 항목에 접근하고 업데이트 하기위해서는 아래와 같이 사용하면 된다.
 */
let myArray = ["hello", "world", "how are you"]
let firstItem = myArray[0] // "hello"
myArray[0] = "hey" // ["hey", "world", "how are you"]