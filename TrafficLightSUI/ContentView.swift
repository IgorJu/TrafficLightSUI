//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Igor on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isButtonPressed = false
    @State private var currentLight = CurrentLight.red
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    @State private var lightIsOn = 1.0
    @State private var lightIsOff = 0.3
    
    var body: some View {
        ZStack {
            Color.indigo
                .edgesIgnoringSafeArea(.all)
            VStack {
                LightCircleView(color: .red)
                    .opacity(redOpacity)
                LightCircleView(color: .yellow)
                    .opacity(yellowOpacity)
                LightCircleView(color: .green)
                    .opacity(greenOpacity)
                Spacer()
                
                Button(action: changeColor) {
                    Text(isButtonPressed ? "NEXT" : "START")
                        .font(.largeTitle)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                }
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 4)
                )
            }
            
            .padding()
        }
    }

    private func changeColor() {
        switch currentLight {
        case .red:
            redOpacity = lightIsOn
            greenOpacity = lightIsOff
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOn
            currentLight = .red
        }
        isButtonPressed = true
    }
}

    private enum CurrentLight {
        case red, yellow, green
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
