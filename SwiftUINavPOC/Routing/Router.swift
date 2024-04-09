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

enum UserProfilRoute: Hashable {
    case userHomePage

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
    @Published var routes = NavigationPath() {
        didSet {
            print("SWG: [\(routes.count)] -> \(routes)")
        }
    }
    @Published var presentedSheet: SheetRoute?
    @Published var fullScreenSheet: FullSheetRoute?

    // MARK: - Navigation helpers

    func navigate<V>(to screen: V) where V: Hashable { routes.append(screen) }
    
    func goBack() { routes.removeLast() }

    func goBack(_ k: Int) {
        guard routes.count - k >= 0, k >= 0 else { return }
        routes.removeLast(k)
    }

    func goToRoot() { routes = NavigationPath() }

    // MARK: - Sheet helpers

    func showSheet(_ sheetToPresent: SheetRoute) { presentedSheet = sheetToPresent }

    func showFullSheet(_ sheetToPresent: FullSheetRoute) { fullScreenSheet = sheetToPresent }

    func dismissSheet() { presentedSheet = nil }

    func dismissFullScreenCover() { fullScreenSheet = nil }
}

