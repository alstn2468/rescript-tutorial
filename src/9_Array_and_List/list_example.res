/* List
 * ReScript는 아래와 같은 특징을 갖는 단방향 연결리스트 또한 제공한다.
 * - 불변하다. (Immutable)
 * - 항목을 앞에 추가할 때 빠르다. (Fast at prepending items)
 * - 끝을 가져올 때 빠르다. (Fast at getting the tail)
 * - 다른 모든것에선 느리다. (Slow at everything else)
 * Array와 마찬가지로 List의 항목들의 타입은 모두 같아야한다.
 * 크기를 조절해야하는 가능성이 있을 경우 앞에 빠르게 항목을 추가하거나 빠르게 분할을 하기위해 List를 사용한다.
 * 항목에 무작위로 접근하거나 앞이 아닌 위치에 항목을 삽입해야하는 경우 List를 사용하지 않는 것이 좋다.
 * ReScript의 표준 라이브러리는 List모듈을 제공한다.
 * https://rescript-lang.org/docs/manual/latest/api/belt/list
 */
let myList = list{1, 2, 3}

// List에 불변하게 항목을 앞에 추가하는 방법
// 아래와 같은 전개(spread) 문법을 사용하면 된다.
// list{a, ...b, ...c}와 같은 문법은 오류를 발생시킨다는 것을 알아야 한다.
// ReScript는 List에서 여러개의 전개를 지원하지 않는다.
// b의 각 항목이 c의 머리에 하나씩 추가되기 때문에 우연하게 선형 연산(O(b))가 된다.
// 이것을 위해 List.concat을 사용할 수 있지만 권장되는 방법은 아니다.
let myList = list{1, 2, 3}
let anotherList = list{0, ...myList}

// List의 항목에 접근하는 방법
// switch가 일반적으로 List의 항목에 접근할 때 사용된다.
// https://rescript-lang.org/docs/manual/latest/pattern-matching-destructuring
let message =
  switch myList {
  | list{} => "This list is empty"
  | list{a, ...rest} => "The head of the list is the string " ++ Js.Int.toString(a)
  }