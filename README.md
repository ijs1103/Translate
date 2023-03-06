# Translate

![Simulator Screen Recording - iPhone 13 Pro - 2023-03-06 at 19 03 28](https://user-images.githubusercontent.com/42196410/223088282-3a782a1f-7c66-48ad-b2d5-f570f857a7c1.gif)

## 🧩 개요

- 네이버 파파고 api로 유저가 입력한 텍스트 번역하기
- 번역된 텍스트 즐겨찾기 (즐겨찾기값 UserDefaults에 저장)


## 🤔 배운 내용

### ✔️ Localization 하기 

1. 프로젝트 내에 Strings File을 생성
2. 생성된 Strings File 우측탭에 파란색 Localize 버튼 클릭
3. 루트 프로젝트 설정에서 Localizations 탭에서 언어 추가 (+버튼)
<img width="392" alt="스크린샷 2023-03-06 오후 8 02 59" src="https://user-images.githubusercontent.com/42196410/223093299-8c634c2e-dae7-487a-bd5d-2a958f7d2872.png">

4. ` “키값” = “표시될 언어의 값” ` 형식으로 작성
5. `NSLocalizedString(“키값”, comment: “표시될 언어의 값”)` 형식으로 코드에서 사용

### ✔️ UICollectionViewCell 셀프 사이징

CollectionViewCell은 inset이 설정 되어 있는 UIStackView로 구성되어 있다.
UIStackView에 의해 셀크기를 셀프 사이징 한다. 

<img width="555" alt="image" src="https://user-images.githubusercontent.com/42196410/223090471-b2ee646d-aa18-4010-bc72-611baee8ebd7.png">


### ✔️ UIStackView에 Inset 적용하기

UIStackView는 다른 UI와 달리 inset을 지정해줘도 바로 적용되지 않는다.

isLayoutMarginsRelativeArrangement 속성을 true로 설정해야 한다.

```swift

stackView.layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
stackView.isLayoutMarginsRelativeArrangement = true

```

### ✔️ Enum 타입에서 forEach 사용하기

Enum 타입에서 CaseIterable을 채택하여 case 값들을 반복문으로 순회 가능하게 해줍니다.

enum을 allCases 타입 프로퍼티로 접근하면 enum에서 array 메소드를 사용할 수 있습니다.

```swift
 
 enum Language: String, CaseIterable, Codable {
  // 이하 생략
 }
 
 Language.allCases.forEach { lang in
  // 이하 생략
 }

```

