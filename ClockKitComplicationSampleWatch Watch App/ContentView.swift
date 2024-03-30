//
//  ContentView.swift
//  ClockKitComplicationSampleWatch Watch App
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
        .frame(width: 30)
      Text("**ClockKit**\nComplication Sample")
        .multilineTextAlignment(.center)
    }
    .foregroundStyle(.cyan)
  }
}

#Preview {
  ContentView()
}
