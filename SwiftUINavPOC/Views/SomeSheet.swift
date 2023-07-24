//
//  SomeSheet.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 23/07/2023.
//

import SwiftUI

struct SomeSheet: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack {
            Text("Hello in fullscreen")

            Button {
                router.dismissFullScreenCover()
            } label: {
                Text("Close")
            }
        }
    }
}
