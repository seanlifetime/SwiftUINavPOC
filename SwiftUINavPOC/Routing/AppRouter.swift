//
//  AppRouter.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 19/07/2023.
//

import SwiftUI

@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: Route.self) { destination in
            switch destination {
            case let .privateNotesView(colour):
                PrivateNotesView(colour: colour)
            case let .shareView(text):
                ShareView(text: text)
            case .listView:
                ListView()
            case let .listDetailView(text):
                ListDetailView(text: text)
            }
        }
    }

    func withUserProfileRouter() -> some View {
        navigationDestination(for: UserProfilRoute.self) { destination in
            switch destination {
            case .userHomePage:
                Text("Hello user home page")
            }
        }
    }

    func withSheetRouter(_ desitnation: Binding<SheetRoute?>) -> some View {
        sheet(item: desitnation) { sheetToPresent in
            switch sheetToPresent {
            case .someSheet:
                Text("Hello")
            }
        }
    }

    func withFullSheetRouter(_ desitnation: Binding<FullSheetRoute?>) -> some View {
        fullScreenCover(item: desitnation) { sheetToPresent in
            switch sheetToPresent {
            case .someSheet:
                SomeSheet()
            }
        }
    }
}
