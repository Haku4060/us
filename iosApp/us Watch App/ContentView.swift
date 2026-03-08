//
//  ContentView.swift
//  us Watch App
//
//  Created by Hakuho Fujiwara on 3/6/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var position = CGPoint.zero;
    
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .foregroundColor(.black)
            .onTapGesture {
                location in position = location
                print(position)
            }
    }
}

#Preview {
    ContentView()
}
