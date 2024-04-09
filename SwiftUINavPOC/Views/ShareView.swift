//
//  ShareView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

struct ShareView: View {
    let text: String

    @EnvironmentObject private var router: Router

    var body: some View {
        VStack {
            Text("Share View")
                .font(.title)
                .foregroundColor(.blue)

            Text(text)
                .font(.title)
                .foregroundColor(.purple)

            Button {
                router.navigate(to: Route.listView)
            } label: {
                Text("Navigate to list")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .navigationTitle("Sharing is caring")
    }
}
