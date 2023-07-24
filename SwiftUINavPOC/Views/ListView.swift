//
//  ListView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

struct ListView: View {
    private var lines = (0...10).map { "line \($0)" }

    @EnvironmentObject private var router: Router

    var body: some View {
        VStack {
            List(lines, id: \.self) { lineItem in
                NavigationLink(value: Route.listDetailView(text: lineItem)) {
                    Text(lineItem)
                }
            }
            .listStyle(.plain)

            Button {
                router.goToRoot()
            } label: {
                Text("Pop to root")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("List")
    }
}
