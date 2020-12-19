/* String
 * ReScript의 string 타입은 큰따옴표(")를 구분자로 사용한다.
 * 문자열을 합치기 위해서는 ++ 연산자를 사용한다.
 */
let gretting = "Hello world!"
let multilineGreeting = "Hello
 world!"
let gretting = "Hello " ++ "world!"

/* String Interpolation
 * 문자열에만 허용되는 특별한 문법이 있다.
 * 여러줄의 문자열
 * 필요하지 않은 특수 문자 이스케이핑
 * 보간법 (Interpolation)
 * 적절한 유니코드 처리
 * 특수 문자를 이스케이핑할 필요가 없는 경우를 제외하고 JavaScript의 `를 사용하는 문자열 보간법과 동일하다.
 * 보간법을 사용할 때 바인딩된 값이 문자열이 아닐 경우 문자열로 변환해야한다.
 * 보간법을 사용할 때 바인딩을 문자열로 암시적으로 변환하려면 j를 앞에 추가하면 된다.
 */
let name = "Joe"

let greeting = `Hello
World
👋
${name}
`
let age = 10
let message = j`Today I am $age years old.`

/* Char
 * ReScript는 하나의 문자만 가지고 있는 문자열 타입을 가지고 있다.
 * Char타입은 유니코드 또는 UTF-8을 지원하지 않으므로 권장되지 않는다.
 * String을 Char로 변환하려면 "a". [0]와 같이 사용하면 된다.
 * 반대로 Char를 String으로 변환하려면 String.make (1, 'a')와 같이 사용하면 된다.
 */
let firstLetterOfAlphabet = 'a'

/* Regular Expression
 * ReScript 정규표현식은 JavaScript에 대응되도록 깔끔하게 컴파일된다.
 * 정규표현식에는 Js.Re.t 타입이 있다.
 */
let r = %re("/b/g")

/* Boolean
 * ReScript의 boolean은 bool타입을 가지며 true 또는 false일 수 있다.
 * && : AND 연산자
 * || : OR 연산자
 * ! : NOT 연산자
 * <=, >=, <, >
 * == : 구조가 같음을 판단하는 연산자, 데이터의 구조를 자세히 비교한다.
 *      편하지만 유의해서 사용해야 한다.
 * === : 참조가 동일한지 판단하는 연산자, 얕은 비교를 한다.
 * != : 구조가 다름을 판단하는 연산자
 * !== : 참조가 다름을 판단하는 연산자
 * ReScript의 true/false는 JavaScript의 true/false로 컴파일 된다.
 */
let a = (1, 2) == (1, 2)
let b = (1, 2) === (1, 2)
let myTuple = (1, 2)
let c = myTuple === myTuple

/* Integers
 * 32비트이며 필요한 경우 잘린다. +, -, *, /등 일반적인 연산자를 제공한다.
 * JavaScript의 number에 바인딩 할 때 주의해야한다.
 * 숫자가 긴 경우에는 잘릴 수 있다.
 * 이 경우 JavaScript의 number(특히 Dates)를 float로 대신 바인딩할 수 있다.
 */

/* Floats
 * Floats타입은 Integers와 다른 연산자를 요구한다. +., -., *., /. 등이 존재한다.
 */
let floatExample = 0.5 +. 0.6

/* Unit
 * Unit타입에는 JavaScript의 undefined로 컴파일되는 단일 값 ()가 존재한다.
 * 다양한 위치에서 플레이스홀더로 사용되는 더미 타입이다.
 * 실제로 이 타입을 보기 전까지는 필요하지 않을 것이다.
 */