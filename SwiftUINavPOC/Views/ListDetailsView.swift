//
//  ListDetailsView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

struct ListDetailView: View {
    let text: String
//    let vm: blah


    @EnvironmentObject private var router: Router

//    init() {
//        vm = blah(router: router)
//    }

    var body: some View {
        VStack(spacing: 16.0) {
            Button {
                router.goBack()
            } label: {
                Text("Go back to where you came from")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            )
            .buttonStyle(PlainButtonStyle())

            Button {
                router.goBack(2)
            } label: {
                Text("Go back and skip the list")
            }
            .padding()
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(Color.white)
            .controlSize(.large)
        }
        .navigationTitle(text)
    }
}

class blah {
    let router: Router

    init(router: Router) {
        self.router = router
    }
}
