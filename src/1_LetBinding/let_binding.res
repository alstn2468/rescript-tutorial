/* Let Binding
 * "let binding"은 다른 언어에서 변수 선언이라고 할 수 있다.
 * 값을 이름에 바인딩합니다. 그 뒤에 오는 코드로 보고 참조할 수 있습니다.
 */
let gretting = "hello!"
let score = 10
let newScore = 10 + score

/* Block Scope
 * {}를 이용해 바인딩 범위를 지정할 수 있다.
 * 블록 스코프 안에서 선언된 변수는 밖에서 접근할 수 없다.
 * 블록 스코프의 마지막 줄의 값은 암시작으로 반환된다.
 */
let message = {
  let part1 = "hello"
  let part2 = "world"
  part1 ++ " " ++ part2
}

/* Design Decisions
 * if, while 및 함수는 모두 동일한 블록 스코프 지정 메커니즘을 사용한다.
 */
let displayGreeting = true
if displayGreeting {
  let message = "Enjoying the docs so far?"
  Js.log(message)
}

/* Binding Are Immutable
 * Let bindings은 불변하며 "바뀔 수 없음"이라고 한다.
 * 이를 통해 타입 시스템이 다른 언어보다 훨씬 더 많은 것을 추론하고 최적화할 수 있다.
 */

/* Binding Shadowing
 * 바인딩이 불변하다는 것은 비현실적으로 들릴 수 있다.
 * 바인딩된 값을 변경하기 위해서 사용할 수 있는 2가지 방법이 있다.
 * 첫 번째는 변수의 값을 변경하는 것이 아닌 경우가 많다는 것을 깨닫는 것이다.
 * Exampe 1 : JavaScript pattern
 * var result = 0;
 * result = calculate(result);
 * result = calculateSomeMore(result);
 * 아래와 같은 방법으로도 작성할 수 있다. 이 코드는 ReScript에서도 동작한다.
 * var result1 = 0;
 * var result2 = calculate(result1);
 * var result3 = calculateSomeMore(result2);
 * ReScript에서는 동일한 let 바인딩 이름을 재사용하면 동일한 이름의 이전 바인딩이 가려진다.
 * 실제로 let binding된 값의 변경은 없다.
 * 많은 코드 조각들에 의해 값이 전달되어 수정되어야 할 경우 더 무거운 변형 기능을 제공한다.
 * 무거운 변형 기능 : https://rescript-lang.org/docs/manual/latest/mutation
 */
let result = 0
let result = 1
let result = 2
// 추천하는 방법은 아니지만 아래의 코드도 유효하다.
let result = "hello"
Js.log(result)
let result = 1
Js.log(result)

/* Private let bindings
 * Private let bindingns은 7.2 버전 릴리즈에 도입되었다.
 * 모듈 시스템에서 모든 필드들이 기본적으로는 public으로 사용된다.
 * 값을 숨기는 유일한 방법은 public 필드와 필드 타입을 나타내는 별도의 시그니처를 제공해야 한다.
 * %private을 이용해 직접적으로 private 필드를 설정할 수 있다.
 * %private는 파일 수준 모듈에도 적용된다.
 * 시그니처를 제공하는 방법은 별도의 컴파일 유닛을 더 잘 제공하고 문서화에도 적합해 권장된다.
 * %private는 아래와 같은 시나리오에서 유용하다.
 * 일부 코드 제너레이터는 일부 값을 숨기려하지만 코드 제너레이터가 public 필드의 타입을 합성하는 것은 어렵거나 시간이 오래 걸린다.
 * 빠른 프로토타이핑을 제작해야할 경우 일부 값을 숨기고 싶으나 인터페이스가 안정적이지 않으면 편리하다.
 */
module A: {
  let b: int
} = {
  let a = 3
  let b = 4
}

module B = {
  let a = 3
  let b = 4
}

module C = {
  %%private(let a = 3)
  let b = 4
}