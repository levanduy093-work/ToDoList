//
//  ContentView.swift
//  ToDoList
//
//  Created by Lê Văn Duy on 18/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.BG)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
