import SwiftUI
import Lottie

public struct CMLottiePlayer: UIViewRepresentable {
    public typealias UIViewType = UIView
    public let filename: String
    public let animationView = AnimationView()
    public let isPaused: Bool
    public let loopMode: LottieLoopMode

    public func makeUIView(context: UIViewRepresentableContext<CMLottiePlayer>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        return view
    }

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CMLottiePlayer>) {
        if isPaused {
            context.coordinator.parent.animationView.pause()
        } else {
            context.coordinator.parent.animationView.play()

        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject {
        var parent: CMLottiePlayer

        init(_ parent: CMLottiePlayer) {
            self.parent = parent
        }
    }
    
    public init(filename: String, isPaused: Bool, loopMode: LottieLoopMode) {
        self.filename = filename
        self.isPaused = isPaused
        self.loopMode = loopMode
    }
    
    public init(filename: String, isPaused: Bool) {
        self.filename = filename
        self.isPaused = isPaused
        self.loopMode = .loop
    }
    
    public init(filename: String) {
        self.filename = filename
        self.isPaused = false
        self.loopMode = .loop
    }
}

extension CMLottiePlayer {
    public func playOnce() -> CMLottiePlayer{
        CMLottiePlayer(filename: self.filename, isPaused: self.isPaused, loopMode: .playOnce)
    }
    
    public func playRepeat(_ count : Float) -> CMLottiePlayer {
        CMLottiePlayer(filename: self.filename, isPaused: self.isPaused, loopMode: .repeat(count))
    }
}
