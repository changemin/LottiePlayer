<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="src/LottieFile.gif" alt="Project logo"></a>
</p>

<h3 align="center">🍭CMLottiePlayer🍭</h3>

<div align="center">

![Version](https://img.shields.io/badge/Version-1.0.0-brightgreen?style=for-the-badge)

</div>

---

<p align="center"> Simple Way to Implement Lottie Animation in SwiftUI
    <br> 
</p>

## 🏁 Getting Started <a name = "getting_started"></a>

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
.package(url: "https://github.com/CM-Material/CMLottiePlayer", from: "1.0.0")
```

### Prepare
Download and Add you Lottie file(JSON) to project file

## 🎈 Usage

```Swift
CMLottiePlayer(filename: "LottieFile")
CMLottiePlayer(filename: "LottieFile", isPlay: Bool)
CMLottiePlayer(filename: "LottieFile", isPlay: Bool, loopMode: LottieLoopMode)
```
* `filename` : Lottie file(JSON) name you added in the project file

#### Modifiers
```Swift
CMLottiePlayer(filename: "LottieFile").playOnce()
// Play only once
CMLottiePlayer(filename: "LottieFile").playRepeat(3)
// Play n times
```

#### Controllable
```Swift
import CMLottiePlayer

struct ContentView: View {
    @State var isPlay: Bool = false
    var body: some View {
        CMLottiePlayer(filename: "LottieFile", isPlay: isPlay)
        
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

- [🇰🇷@Changemin](https://github.com/kylelobo)
