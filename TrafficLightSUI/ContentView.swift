//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Igor on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentLight = CurrentLight.off
        
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
                LightCircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                LightCircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                LightCircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                Spacer()
                changeColorButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    changeColor()
                }
            }
            .padding()
        }
    }

private func changeColor() {
        switch currentLight {
        case .off: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

enum CurrentLight {
    case off, red, yellow, green
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct changeColorButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 4)
                )
        }
    }
}
