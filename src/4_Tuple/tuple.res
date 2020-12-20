/* Tuple
 * Tuple은 JavaScript에는 없는 ReScrpt 전용 데이터 구조다.\
 * Tuple은 아래와 같은 특성이 존재한다.
 * - 불변함 (Immutable)
 * - 순서가 존재함 (Ordered)
 * - 생성될 때 고정된 크기를 갖음 (Fix-sized at creation time)
 * - 불균일함 (Heterogeneous, 다른 타입의 값을 가질 수 있음)
 * Tuple타입은 타입 주석 또한 사용할 수 있다.
 * Tuple타입은 시각적으로 Tuple의 값과 비슷하다.
 * 참고 : 크기가 1인 튜플은 존재하지 않는다. 크기가 1일 경우 값 자체를 사용하는 것이다.
 */
let ageAndName = (24, "Lil' ReScript")
let my3dCoordinates = (20.0, 30.5, 100.0)
let ageAndName: (int, string) = (24, "Lil' ReScript")
// a tuple type alias
type coord3d = (float, float, float)
let my3dCoordinates: coord3d = (20.0, 30.5, 100.0)

/* Usage
 * Tuple의 특정 맴버를 얻으료면 Tuple을 비구조화 할 수 있다.
 * _는 Tuple의 표시된 맴버들을 무시하고 있음을 의미한다.
 * Tuple은 변경과 같은 업데이트를 할 수 없다.
 * 이전 항목들을 비구조화하여 새로운 Tuple을 생성해야 한다.
 */
let (_, y, _) = my3dCoordinates // y를 얻을 수 있다.
let coordinates1 = (10, 20, 30)
let (c1x, _, _) = coordinates1
let coordinates2 = (c1x + 50, 20, 30)