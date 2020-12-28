/* Null, Undefined and Option
 * ReScriptt에는 null 또는 undefined 개념이 존재하지 않는다.
 * 모든 카테고리의 버그를 없애기 때문에 이것은 좋은 일이다.
 * 더이상 undefined is not function이나 cannot access someAttriute of undefined를 마주칠 일이 없다.
 * 그러나, 잠재적으로 존재하지 않는 값에 대한 개념은 여전히 유용하고, ReScript에도 안전하게 존재한다.
 * option타입으로 값을 감싸 값의 존재와 존재하지 않음을 나타낸다다.
 * 표준 라이브러리에서 정의한 내용은 아래와 같다.
 */
type option<'a> = None | Some('a)

let licenseNumber = 5

// null일 수도 있다는 개념을 나타내려면 이 변수를 감싸 option타입으로 변환해야 한다.
// 좀 더 설명이되는 예시를 위해 아래와 같은 조건을 제시할 수 있다.
let personHasACar = true
let licenseNumber1 =
  if personHasACar {
    Some(5)
  } else {
    None
  }

let personHasACar = false
let licenseNumber2 =
  if personHasACar {
    Some(5)
  } else {
    None
  }

// 나중에 다른 코드 조각이 이런 값을 받으면 패턴 매칭를 통해 두 가지 경우를 모두 처리해야한다
switch licenseNumber1 {
| None =>
  Js.log("The person doesn't have a car")
| Some(number) =>
  Js.log("The person's license number is " ++ Js.Int.toString(number))
}

// x는 간단히 5로 컴파일되고,
let x = Some(5)
// x는 undefined로 컴파일 된다
let x = None

// ReScript에서는 option 값을 구성할 수 있기 때문에 option에서 undefined로 번환되는 것은 완벽하지 않다.
// 이 x는 여전히 5로 컴파일된다.
let x = Some(Some(Some(5)))
// 아래 코드는 문제가 생긴다.
let x = Some(None)
// 절대로 Some(Some(Some(5)))와 같은 충첩된 option값을 JavaScript로 넘기면 안된다.
// 절대로 JavaScript에서 온 값에 option<'a>로 타입 주석을 작성하면 안된다. 항상 고정된 비다형성 타입을 주어야한다.

@bs.module("./constant.js") external myId: Js.Nullable.t<string> = "myId"
@bs.module("./constant.js") external myId2: Js.Nullable.t<string> = "myId2"
Js.log(myId)
Js.log(myId2)

@bs.module("./validator.js") external validate: Js.Nullable.t<string> => bool = "validate"
let personId: Js.Nullable.t<string> = Js.Nullable.return("abc123")

let result = validate(personId)
Js.log(result)