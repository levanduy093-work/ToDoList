//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Lê Văn Duy on 18/11/2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
