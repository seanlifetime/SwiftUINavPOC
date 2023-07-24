//
//  Router.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 19/07/2023.
//

import SwiftUI

// MARK: - Screen routes

enum Route: Hashable {
    case privateNotesView(colour: Color)
    case shareView(text: String)
    case listView
    case listDetailView(text: String)

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

// MARK: - Sheet routes

enum SheetRoute: Identifiable {
    case someSheet

    var id: String {
        switch self {
        case .someSheet: return "someSheet"
        }
    }
}

// MARK: - Full sheet routes

enum FullSheetRoute: Identifiable {
    case someSheet

    var id: String {
        switch self {
        case .someSheet: return "someFullScreenSheet"
        }
    }
}

// MARK: - Router

class Router: ObservableObject {
    @Published var routes = [Route]() {
        didSet {
            print("SWG: [\(routes.count)] -> \(routes)")
        }
    }
    @Published var presentedSheet: SheetRoute?
    @Published var fullScreenSheet: FullSheetRoute?

    // MARK: - Navigation helpers

    func navigate(to screen: Route) { routes.append(screen) }
    
    func goBack() { _ = routes.popLast() }

    func goBack(_ k: Int) { routes = routes.dropLast(k) }

    func goToRoot() { routes = [] }

    // MARK: - Sheet helpers

    func showSheet(_ sheetToPresent: SheetRoute) { presentedSheet = sheetToPresent }

    func showFullSheet(_ sheetToPresent: FullSheetRoute) { fullScreenSheet = sheetToPresent }

    func dismissSheet() { presentedSheet = nil }

    func dismissFullScreenCover() { fullScreenSheet = nil }
}

