/* Variant
 * 대부분의 언어에서 대부분의 자료구조는 "이것 and 저것"에 관한 것이다.
 * Variant는 우리가 "이것 or 저것"을 표현할 수 있게 해준다.
 * myResponse는 Yes, No, PrettyMuch의 Variant 타입이며,
 * 이를 "Variant 생성자"(또는 "Variant 태그")라고 합니다. |는 각 생성자를 분리한다.
 */
type myResponse =
  | Yes
  | No
  | PrettyMuch

let areYouCrushingIt = Yes

// 사용 중인 Variant 모델이 다른 파일에 있는 경우 Record에서 사용하는 것과 같은 범위로 가져온다.
let pet: Zoo.animal = Dog
let pet2 = Zoo.Dog

// Variant 생성자는 ,로 구분된 추가 데이터를 저장할 수 있다.
type account =
  | None
  | Instagram(string)
  | Facebook(string, int)

// Instagram은 string타입 값을 가질 수 있으며 Facebook은 string타입과 int타입 값을 가질 수 있다.
let myAccount = Facebook("Josh", 26)
let friendAccount = Instagram("Jenny")

// Variant의 인자에 여러 개의 필드가 있는 경우 Record와 유사한 구문을 사용하여 읽기 쉽도록 레이블을 지정할 수 있다.
type user =
  | Number(int)
  | Id({name: string, password: string})

let me = Id({name: "Joe", password: "123"})

// 이를 기술적으로 "인라인 레코드"라고 하며, Variat생성자 내에서만 허용됩니다.
// Record타입 선언은 ReScript의 다른 곳에서는 인라인으로 연결할 수 없다.
// 물론, 일반 Record타입도 Variant모델에 넣을 수 있다.
type u = {name: string, password: string}
type userTwo =
  | Number(int)
  | Id(u)

let me = Id({name: "Joe", password: "123"})

/*JavaScript 출력
 * Variant는 타입 선언에 따라 가능한 JavaScript 출력 3개로 컴파일된다.
 * - Variant가 인자가 없는 생성자인 경우 number로 컴파일된다.
 * - 인자가 있는 생성자일 경우, 첫 번째 인자의 경우 _0필드와 두 번째 인자의 경우 _1필드가 있는 객체로 컴파일된다.
 * - 위의 예외는 타입 선언에 인자가 있는 단일 생성자만 포함된 Variant다.
 *   이 경우 생성자는 TAG 필드가 없는 객체로 컴파일된다.
 * - 레이블이 지정된 Variant 인자는 _0, _1등 대신 레이블 이름을 가진 객체로 컴파일된다.
 *   객체에는 이전 규칙에 따라 TAG필드가 있거나 없을 수 있다.
 */
type greeting = Hello | Goodbye
let g1 = Hello
let g2 = Goodbye

type outcome = Good | Error(string)
let o1 = Good
let o2 = Error("oops!")

type family = Child | Mom(int, string) | Dad (int)
let f1 = Child
let f2 = Mom(30, "Jane")
let f3 = Dad(32)

type person = Teacher | Student({gpa: float})
let p1 = Teacher
let p2 = Student({gpa: 99.5})

type s = {score: float}
type adventurer = Warrior(s) | Wizard(string)
let a1 = Warrior({score: 10.5})
let a2 = Wizard("Joe")

// 2개의 인자를 가진 생성자와 단일 튜플 인자를 가진 생성자를 혼동하지 않도록 주의해야한다.
type account2 =
  | Facebook(string, int) // 두개의 인자
type account3 =
  | Instagram((string, int)) // 한개의 인자 튜플