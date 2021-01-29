<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="src/LottieFile.gif" alt="Project logo"></a>
</p>

<h3 align="center">🍭SwiftUI Lottie Player🍭</h3>

<div align="center">

![Release](https://img.shields.io/github/v/release/Changemin/LottiePlayer?style=for-the-badge)


</div>

---

<p align="center"> Easiest Way to Represent Lottie Animation in SwiftUI
    <br> 
</p>

## 🏁 Getting Started

### Requirements
* iOS 14+
* macOS 11+
* SwiftUI

### Installing
#### Swift Package Manager
```Swift
File ➜ Swift Packages ➜ Add Package Dependancy..
```
```Swift
.package(url: "https://github.com/Changemin/LottiePlayer", from: "1.1.0")
```

### Prepare
Download and Add you Lottie file(JSON) to project file

## 🎈 Usage

#### 👶 Simple
```Swift
LottiePlayer(filename: "LottieFile")
```
* `filename` : Lottie file(JSON) name you added in the project file


#### 🛠Modifiers
```Swift
LottiePlayer(filename: "LottieFile").playOnce()
// Play only once
LottiePlayer(filename: "LottieFile").playRepeat(3)
// Play n times
```
#### 🕹Controllable

```Swift
LottiePlayer(filename: "LottieFile", isPlay: Bool, loopMode: LottieLoopMode)
```
* `isPlay` : Boolean that controls play/pause
* `loopMode` : `LottieLoopMode`

## Example
```Swift
import LottiePlayer

struct ContentView: View {
    @State var isPlay: Bool = false
    var body: some View {
        LottiePlayer(filename: "LottieFile", isPlay: isPlay)
        
        Button(action: {
            isPlay.toggle()
            // Change play or not
        }) {
            Text(isPlay ? "Pause" : "Play")
        }
    }
}
```

## ✍️ Author

- Byun Kyung Min ➜ [🇰🇷@Changemin](https://github.com/Changemin)
