# Translate

![Simulator Screen Recording - iPhone 13 Pro - 2023-03-06 at 19 03 28](https://user-images.githubusercontent.com/42196410/223088282-3a782a1f-7c66-48ad-b2d5-f570f857a7c1.gif)

## ๐งฉ ๊ฐ์

- ๋ค์ด๋ฒ ํํ๊ณ  api๋ก ์ ์ ๊ฐ ์๋ ฅํ ํ์คํธ ๋ฒ์ญํ๊ธฐ
- ๋ฒ์ญ๋ ํ์คํธ ์ฆ๊ฒจ์ฐพ๊ธฐ (์ฆ๊ฒจ์ฐพ๊ธฐ๊ฐ UserDefaults์ ์ ์ฅ)


## ๐ค ๋ฐฐ์ด ๋ด์ฉ

### โ๏ธ Localization ํ๊ธฐ 

1. ํ๋ก์ ํธ ๋ด์ Strings File์ ์์ฑ
2. ์์ฑ๋ Strings File ์ฐ์ธกํญ์ ํ๋์ Localize ๋ฒํผ ํด๋ฆญ
3. ๋ฃจํธ ํ๋ก์ ํธ ์ค์ ์์ Localizations ํญ์์ ์ธ์ด ์ถ๊ฐ (+๋ฒํผ)
<img width="392" alt="แแณแแณแแตแซแแฃแบ 2023-03-06 แแฉแแฎ 8 02 59" src="https://user-images.githubusercontent.com/42196410/223093299-8c634c2e-dae7-487a-bd5d-2a958f7d2872.png">

4. ` โํค๊ฐโ = โํ์๋  ์ธ์ด์ ๊ฐโ ` ํ์์ผ๋ก ์์ฑ
5. `NSLocalizedString(โํค๊ฐโ, comment: โํ์๋  ์ธ์ด์ ๊ฐโ)` ํ์์ผ๋ก ์ฝ๋์์ ์ฌ์ฉ

### โ๏ธ UICollectionViewCell ์ํ ์ฌ์ด์ง

CollectionViewCell์ inset์ด ์ค์  ๋์ด ์๋ UIStackView๋ก ๊ตฌ์ฑ๋์ด ์๋ค.
UIStackView์ ์ํด ์ํฌ๊ธฐ๋ฅผ ์ํ ์ฌ์ด์ง ํ๋ค. 

<img width="555" alt="image" src="https://user-images.githubusercontent.com/42196410/223090471-b2ee646d-aa18-4010-bc72-611baee8ebd7.png">


### โ๏ธ UIStackView์ Inset ์ ์ฉํ๊ธฐ

UIStackView๋ ๋ค๋ฅธ UI์ ๋ฌ๋ฆฌ inset์ ์ง์ ํด์ค๋ ๋ฐ๋ก ์ ์ฉ๋์ง ์๋๋ค.

isLayoutMarginsRelativeArrangement ์์ฑ์ true๋ก ์ค์ ํด์ผ ํ๋ค.

```swift

stackView.layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
stackView.isLayoutMarginsRelativeArrangement = true

```

### โ๏ธ Enum ํ์์์ forEach ์ฌ์ฉํ๊ธฐ

Enum ํ์์์ CaseIterable์ ์ฑํํ์ฌ case ๊ฐ๋ค์ ๋ฐ๋ณต๋ฌธ์ผ๋ก ์ํ ๊ฐ๋ฅํ๊ฒ ํด์ค๋๋ค.

enum์ allCases ํ์ ํ๋กํผํฐ๋ก ์ ๊ทผํ๋ฉด enum์์ array ๋ฉ์๋๋ฅผ ์ฌ์ฉํ  ์ ์์ต๋๋ค.

```swift
 
 enum Language: String, CaseIterable, Codable {
  // ์ดํ ์๋ต
 }
 
 Language.allCases.forEach { lang in
  // ์ดํ ์๋ต
 }

```

