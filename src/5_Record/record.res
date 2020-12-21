/* Type Declaration
 * Record는 JavaScript의 객체와 비슷하지만 아래와 같은 차이점이 존재한다.
 * - 기본적으로 불변하다.
 * - 확장 불가능한 고정적인 필드들을 갖는다.
 * Record는 필수적으로 타입 선언이 필요하다.
 */
type person = {
  age: int,
  name: string
}

/* Creation
 * 새로운 Record값을 생성하면 ReScript는 값의 모양과 알맞는 Record타입을 찾으려한다.
 * 따라서 여기서 me의 값은 person타입으로 추론된다.
 * 대신에 타입이 다른 파일이나 모듈에 존재할 경우 해당 파일 또는 모듈을 명시적으로 표시해야 한다.
 */
let me = {
  age: 5,
  name: "Big ReScript"
}
let me: School.person = {age: 20, name: "Big ReScript"}
let me2 = {School.age: 20, name: "Big ReScript"}
// 위의 예시는 Record의 타입 정의가 School 파일에 존재한다 명시되어 있다.
// 첫번째 예시인 `me: School.person`과 같은 일반적인 타입 주석이 더 선호된다.

/* Access
 * 친숙한 .표기법을 사용해 Record의 필드에 접근할 수 있다.
 */
let name = me.name

/* Immutable Update
 * 오래된 Record로부터 새로운 Record를 생성해야 할 경우
 * 전개 연산자인 ...를 사용해 원본 Record의 변형없이 새로운 Record를 생성할 수 있다.
 *  Record의 형태는 타입에따라 고정되어 있으므로 전개 연산자를 사용해도 Record에 새로운 필드를 추가할 수 없다.
 */
let meNextYear = {...me, age: me.age + 1}

/* Mutable Update
 * 선택적으로 Record의 필드를 변경할 수 있다.
 * Record의 필드에 mutable키워드를 추가하고 = 연산자를 사용해 해당 필드를 효율적으로 업데이트 할 수 있다.
 * 타입 선언에서 mutable이 명시되지 않은 필드는 업데이트할 수 없다.
 * 타입 선언에서 mutable이 명시되지 않은 필드는 업데이트할 수 없다.
 */
type mutablePerson = {
  name: string,
  mutable age: int
}

let baby = {name: "Baby ReScript", age: 5}
baby.age = baby.age + 1

/* Tip & Trick
 * Record의 타입은 필드의 이름으로 찾을 수 있다.
 * 레코드의 경우 "age필드가 있는 한 함수가 모든 Record타입을 사용하고 싶다"라고 말할 수 없다.
 * 아래 코드는 의도 한대로 작동하지 않는다.
 */
type person2 = {age: int, name: string}
type monster = {age: int, hasTentacles: bool}

let getAge = (entity) => entity.age

//대신 getAge함수는 매개 변수 entity가 age필드가 존재하는 가장 가까운 Record타입인 monster라고 추론할 것이다.
// 따라서 아래 코드의 마지막 줄에서 에러가 발생한다.
// 타입 시스템은 me가 person타입이고 getAge함수는 monster타입에 대해서만 동작한다고 오류를 발생시킬 것이다.
//이러한 기능이 필요한 경우 ReScript object를 사용하면 된다.
//https://rescript-lang.org/docs/manual/latest/object
let kraken = {age: 9999, hasTentacles: true}
let me = {age: 5, name: "Baby ReScript"}

let age = getAge(kraken)
// getAge(me) type error!