//
//  SplashView.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import SwiftUI

struct SplashView: View {
    @State private var displaySplash: Bool = true
    var body: some View {
        HStack {
            if self.displaySplash {
                SplashContent()
            } else {
                MainView()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.displaySplash = false
                }
            }
        }
    }
}

struct SplashContent: View {
    @State private var animation = false
    private var image: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .rotationEffect(animation ? Angle(degrees: 200) : Angle(degrees: 0))
    }

    private let animationTimer = Timer.publish(every: 1.5, on: .current, in: .common).autoconnect()

    private func launchAnimation() {
        withAnimation(.easeInOut(duration: 1)) {
            animation.toggle()
        }
    }

    var body: some View {
        ZStack {
            image
        }.onReceive(animationTimer) { timerValue in
            launchAnimation()
        }.opacity(animation ? 0 : 1)
    }
}
