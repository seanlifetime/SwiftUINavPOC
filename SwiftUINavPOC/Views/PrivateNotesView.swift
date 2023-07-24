//
//  PrivateNotesView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

struct PrivateNotesView: View {
    let colour: Color

    var body: some View {
        colour
            .ignoresSafeArea(edges: .all)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Private Notes")
    }
}
