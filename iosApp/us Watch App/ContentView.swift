//
//  ContentView.swift
//  us Watch App
//
//  Created by Hakuho Fujiwara on 3/6/26.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    
    @State private var rippleLocation: CGPoint = .zero
    @State private var rippleScale: CGFloat = 0.1
    @State private var rippleOpacity: Double = 0
    @State private var userName = "Loading..."
    @State private var userStatus = "Loading..."
    @State private var statusColor = Color.white
    @State private var isHolding = false
    
    var body: some View {
        VStack {
            // Your main background content
            Color.black.ignoresSafeArea()
            Text(userName)
                .task {
                    do {
                        userName = try await getUserName(userId: 1000)
                    } catch {
                        userName = "Failed to load"
                        print(error)
                    }
                }
            Text(userStatus)
                .foregroundStyle(statusColor)
                .task {
                    do{
                        userStatus = try await getUserStatus(userId: 1000)
                    }catch{
                        userStatus = "No connection"
                        print(error)
                    }
                    if(userStatus == "offline"){
                        statusColor = Color.red
                    }else if(userStatus == "online"){
                        statusColor = Color.green
                    }
                }
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
            triggerRipple(at: location)
            WKInterfaceDevice.current().play(.click)
        }
        .onLongPressGesture(
            minimumDuration: 0.1,
            pressing: { pressing in
                if pressing {
                    startVibration()
                } else {
                    stopVibration()
                }
            },
            perform: {}
        )
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
        func startVibration() {
            guard !isHolding else { return }
            isHolding = true
            vibrateLoop()
        }
        
        func stopVibration() {
            isHolding = false
        }
        func vibrateLoop() {
            guard isHolding else { return }
            
            WKInterfaceDevice.current().play(.retry)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                vibrateLoop()
            }
        }
    }
    #Preview {
        ContentView()
}
