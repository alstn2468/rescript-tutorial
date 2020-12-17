/* Inference
 * 아래 코드에는 어떠한 작성된 타입이 존재하지 않는다.
 * ReScript는 let binding된 score가 int 타입이라는 것을 값인 10에 의해 추론한다.
 * 마찬가지로 add 함수에 사용되는 + 연산자는 int 타입에만 동작할 수 있는 연산자다.
 * 따라서 add 함수는 두 개의 int 타입 인자를 받으며 int 타입을 반환하는 것을 알고있다.
 */
let score = 10
let add = (a, b) => a + b

/* Type Annotation
 * 타입은 추론할 수 있지만 선택적으로 타입 주석을 통해 타입을 작성할 수 있다.
 * 만약 타입 주석의 타입과 추론된 타입과 일치하지 않을 경우 컴파일 타임에서 오류가 발생한다.
 * 다른 언어들과 달리 ReScript는 사용자가 작성한 타입 수적이 정확하다고 가정하지 않는다.
 * 또한 괄호를 이용해 표현식을 묶고 타입 주석을 작성할 수도 있습니다.
 * 마지막 줄의 `(~radius as r: int)`는 레이블이 지정된(labeled) 인자다.
 * 자세한 내용은 [함수 페이지](https://rescript-lang.org/docs/manual/latest/function)를 참조할 수 있다.
 */
let myInt = 5
let myInt: int = 5
let myInt = (5: int) + (4: int)
let add = (x: int, y: int): int => x + y
// let drawCircle = (~radius as r: int): circleType => /* code here */

/* Type Alias
 * 타입 별칭을 이용해 다른 이름으로 타입을 참조할 수 있다.
 * 코드의 `scoreType`은 `int` 타입과 동일하다.
 */
type scoreType = int
let x: scoreType = 10

/* Type Parameter (aka Generic)
 * 타입은 다른 언어들에서 제네릭과 유사한 매개변수들을 받을 수 있다.
 * 매개변수의 이름은 '로 시작해야 한다.
 * 매개변수화된 타입의 사용은 중복을 제거하는 것이다.
 * ReScript는 타입을 추론할 수 있으므로 buddy와 같이 작성할 수 있다.
 * 타입 인자는 많은 곳에 나타나며 ReScript의 배열은 `array<'a>`와 같이 타입 매개변수를 요구하는 타입이다.
 * 타입이 매개변수를 받지 않는 경우 표준 라이브러리에서 지루하게 타입을 정의해야 한다.
 * 타입은 많은 인자들을 받을 수 있으며 구성이 가능하다.
 */
type intCoordinates = (int, int, int)
type floatCoordinates = (float, float, float)

let a: intCoordinates = (10, 20, 20)
let b: floatCoordinates = (10.5, 20.5, 20.5)

type coordinates<'a> = ('a, 'a, 'a)

let a: coordinates<int> = (10, 20, 20)
let b: coordinates<float> = (10.5, 20.5, 20.5)

let buddy = (10, 20, 20)

// `array<string>`으로 추론된다.
let greetings = ["hello", "world", "how are you"]

type result<'a, 'b> =
  | Ok('a)
  | Error('b)

type myPayload = {data: string}

type myPayloadResults<'errorType> = array<result<myPayload, 'errorType>>

let payloadResults: myPayloadResults<string> = [
  Ok({data: "hi"}),
  Ok({data: "bye"}),
  Error("Something wrong happened!")
]

/* Recursive Types
 * 함수와 같이 타입도 rec를 사용해 스스로를 참조할 수 있다.
 * person타입의 필드인 friends는 array<person>타입이다.
 * rec을 이용해 자기 자신의 타입인 person타입을 참조할 수 있다.
 */
type rec person = {
  name: string,
  friends: array<person>
}

/* Mutually Recursive Types
 * 타입은 and를 이용해 상호 재귀적으로 사용할 수도 있다.
 */
type rec student = {taughtBy: teacher}
and teacher = {students: array<student>}

/* Type Escape Hatch
 * ReScript의 타입 시스템은 견고하며 암시적 타입 캐스팅, 임의의 값 타입 추측과 같은 위험하고 안전하지 않은 것들을 허용하지 않는다.
 * 하지만 실용적으로 ReScript는 타입 시스템에게 거짓말을 할 수 있도록 하나의 탈출구를 노출한다.
 * 이 기능은 남용하지 않는게 좋으며 지나치게 동적인 JavaScript 코드와 같이 사용해야 한다면 유용하게 사용할 수 있다.
 * 자세한 enternal 기능들은 [여기](https://rescript-lang.org/docs/manual/latest/external)에서 확인할 수 있다.
 * 이 특정 `external` 기능이 `@bs` 주석이 앞에 붙지않는 유일한 항목이다.
 */
// external myShadyConversion: myType1 => myType2 = "%identity"
external convertToFloat : int => float = "%identity"
let age = 10
let gpa = 2.1 +. convertToFloat(age)