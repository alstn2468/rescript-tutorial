/* Object
 * ReScript의 Object타입은 Record타입과 비슷하지만 아래와 같은 차이점이 있다.
 * - 타입 선언이 필요하지 않다.
 * - Record타입과 다르게 구조적이고 다형성이 강하다.
 * - 객체가 JavaScript쪽에서 오지 않는한 업데이트를 지원하지 않는다.
 * - 패턴 매칭을 지원하지 않는다.
 * Record타입과 달리 타입 선언이 선택적이다.
 * Record타입의 타입 선언 문법과 보기에 비슷하지만 필드의 이름이 "로 감싸져 있다.
 */
type person = {
  "age": int,
  "name": string
};

let me = {
  "age": 5,
  "name": "Big ReScript"
}

type personTwo = {
  "age": int
};

// 위에서 설명한 것처럼, Record와 달리 이 me는 "age" 및 "name"필드를 사용하여 일치하는 타입 선언을 찾으려고 하지 않는다.
// 대신 me의 타입은 {"age":int, "name":string}로 추론된다.
// 이는 편리하지만 아래의 코드가 오류 없이 타입 검사를 통과한다는 것을 의미한다.
let me = {
  "age": "hello!" // age는 string이지만 오류가 발생하지 않는다.
}

// Object값을 미리 선언된 Object타입으로 지정하기위해서는 아래와 같이 타입 주석을 사용하면 된다.
// 오류 발생
// let me:person = {
//   "age": "hello!"
// }

let age = me["age"]

// Object가 JavaScript에서 오는 바인딩이 아닌 경우 허용되지 않는다.
// 이 경우에는 =:를 사용한다.
type student = {
  @bs.set "age": int,
  @bs.set "name": string,
}
@bs.module("./test.js") external student1: student = "student1"

student1["name"] = "Mary"
Js.log(student1)
