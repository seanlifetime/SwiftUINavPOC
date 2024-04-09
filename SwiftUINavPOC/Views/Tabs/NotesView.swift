//
//  NotesView.swift
//  SwiftUINavPOC
//
//  Created by Sean Goldin on 20/07/2023.
//

import SwiftUI

class ViewModelFTW: Router {
    func showShareView() {
        navigate(to: Route.shareView(text: "WOW MAN"))
    }

    func presentSheet() {
        presentedSheet = .someSheet
    }
}

class ViewModel {
    func showShareView() -> Route {

        return .shareView(text: "WOW MAN")
    }

    func presentSheet() -> SheetRoute { .someSheet }

    func presentFullSheet() -> FullSheetRoute { .someSheet }
}

struct NotesView: View {
    @StateObject private var router = Router()
    
    private var viewModel = ViewModel()

    var body: some View {
        NavigationStack(path: $router.routes) {
            VStack {
                Text("Notes View")
                    .font(.title)
                    .foregroundColor(.blue)

                Button {
                    router.navigate(to: viewModel.showShareView())
                } label: {
                    Text("Navigate to share view")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Button {
                    router.showSheet(viewModel.presentSheet())
                } label: {
                    Text("Show sheet")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Button {
                    router.showFullSheet(viewModel.presentFullSheet())
                } label: {
                    Text("Show FULL sheet")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .withAppRouter()
            .withSheetRouter($router.presentedSheet)
            .withFullSheetRouter($router.fullScreenSheet)
            .navigationTitle("Notes")
        }
        .environmentObject(router)
    }
}
