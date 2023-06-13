//
//  LightCircleView.swift
//  TrafficLightSUI
//
//  Created by Igor on 08.06.2023.
//

import SwiftUI

struct LightCircleView: View {
    let color: Color
    let opacity: Double

    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(.black, lineWidth: 4))
    }
}

struct LightCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LightCircleView(color: .red, opacity: 1.0)

    }
}
