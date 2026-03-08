//
//  ContentView.swift
//  us Watch App
//
//  Created by Hakuho Fujiwara on 3/6/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rippleLocation: CGPoint = .zero
    @State private var rippleScale: CGFloat = 0.1
    @State private var rippleOpacity: Double = 0
    
    var body: some View {
        ZStack {
                    // Your main background content
                    Color.black.ignoresSafeArea()
                    // The Ripple Effect
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width: 80, height: 80)
                        .scaleEffect(rippleScale)
                        .opacity(rippleOpacity)
                        .position(rippleLocation) // Moves circle to tap spot
                }
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()// Makes the whole area tappable
                .onTapGesture { location in
                    triggerRipple(at: location)                }
            }
            
            func triggerRipple(at location: CGPoint) {
                rippleLocation = location
                rippleScale = 0.1
                rippleOpacity = 1.0
                
                withAnimation(.easeOut(duration: 1.5)) {
                    rippleScale = 2.0
                    rippleOpacity = 0
                }
            }
    }


#Preview {
    ContentView()
}
