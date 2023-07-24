//
//  SwiftUINavPOCApp.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 19/07/2023.
//
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                EditorView()
                    .tabItem {
                        Label("Editor", systemImage: "pencil.circle")
                        Text("Editor")
                    }
                    .tag(0)

                NotesView()
                    .tabItem {
                        Label("Notes", systemImage: "note.text")
                        Text("Notes")
                    }
                    .tag(1)
            }
        }
    }
}
