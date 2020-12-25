//
//  CMLottiePlayer.swift
//  CMLottiePlayer
//
//  Created by 변경민 on 2020/12/25.
//

import SwiftUI
import Lottie

/// Easy & Simple Way to Use Lottie Animation
public struct CMLottiePlayer: UIViewRepresentable {
    public typealias UIViewType = UIView
    public let filename: String
    public let animationView = AnimationView()
    public let isPlay: Bool
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
        if isPlay {
            context.coordinator.parent.animationView.play()
        } else {
            context.coordinator.parent.animationView.pause()

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
    
    /// Configrate Lottie Animation Loop Mode( .loop, .playOnce , etc..)
    public init(filename: String, isPlay: Bool, loopMode: LottieLoopMode) {
        self.filename = filename
        self.isPlay = isPlay
        self.loopMode = loopMode
    }
    
    /// Control Play & Pause through isPaused
    public init(filename: String, isPlay: Bool) {
        self.filename = filename
        self.isPlay = isPlay
        self.loopMode = .loop
    }
    
    /// Only Filename, playmode:.loop(default)
    public init(filename: String) {
        self.filename = filename
        self.isPlay = true
        self.loopMode = .loop
    }
}

extension CMLottiePlayer {
    /// View Modifier for CMLottiePlayer that makes loopMode to .playOnce
    public func playOnce() -> CMLottiePlayer{
        CMLottiePlayer(filename: self.filename, isPlay: self.isPlay, loopMode: .playOnce)
    }
    
    /// View Modifier for CMLottiePlayer that makes loopMode to .repeat(count: Float)
    public func playRepeat(_ count : Float) -> CMLottiePlayer {
        CMLottiePlayer(filename: self.filename, isPlay: self.isPlay, loopMode: .repeat(count))
    }
}
