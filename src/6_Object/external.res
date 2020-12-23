// document의 타입은 랜덤 타입인 'a 다
// 굳이 명시하지 않아도 되는 타입이다.
@bs.val external document: 'a = "document"

// 메서드 호출
document["addEventListener"]("mouseup", _event => {
  Js.log("clicked!")
})

// 속성 가져오기
let loc = document["location"]

// 속성 설정하기
document["location"]["href"] = "http://www.rescript-lang.org"