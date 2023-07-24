//
//  EditorView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

struct EditorView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.routes) {
            VStack {
                Text("Editor View")
                    .font(.title)
                    .foregroundColor(.blue)

                Button {
                    router.navigate(to: .privateNotesView(colour: .purple))
                } label: {
                    Text("Navigate to purple notes")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .environmentObject(router)
            .withAppRouter()
            .navigationTitle("Editor")
        }
    }
}
