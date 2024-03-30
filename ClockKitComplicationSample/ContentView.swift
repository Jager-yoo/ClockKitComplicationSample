//
//  ContentView.swift
//  ClockKitComplicationSample
//
//  Created by 유재호 on 3/30/24.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    VStack {
      Image(systemName: "applewatch")
        .resizable()
        .scaledToFit()
        .frame(width: 50)
      Text("**ClockKit**\nComplication Sample")
        .multilineTextAlignment(.center)
    }
    .font(.largeTitle)
    .foregroundStyle(.cyan)
  }
}

#Preview {
  ContentView()
}
