//
//  ContentView.swift
//  us Watch App
//
//  Created by Hakuho Fujiwara on 3/6/26.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    var body: some View {
        Text("tap")
            .onTapGesture(){
                WKInterfaceDevice.current().play(.click)
            }
    }
}
#Preview {
    ContentView()
}
