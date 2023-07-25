//
//  RouterTests.swift
//  RouterTests
//
//  Created by Sean Goldin on 25/07/2023.
//

import Combine
import XCTest
@testable import SwiftUINavPOC

final class RouterTests: XCTestCase {
    private var routeActions: [Route]!
    private var sheetAction: SheetRoute?
    private var fullSheetAction: FullSheetRoute?

    private var router: Router!

    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        routeActions = [Route]()
        router = Router()
        cancellables = Set<AnyCancellable>()

        sheetAction = nil
        fullSheetAction = nil

        setUpListening()
    }

    func testRouting() {
        router.navigate(to: .listView)
        router.navigate(to: .listDetailView(text: "Johnny"))

        XCTAssertEqual(routeActions, [.listView, .listDetailView(text: "Johnny")])
    }

    func testSheetPresentation() {
        router.showSheet(.someSheet)

        XCTAssertNil(fullSheetAction)
        XCTAssertNotNil(sheetAction)

        router.dismissSheet()

        XCTAssertNil(fullSheetAction)
        XCTAssertNil(sheetAction)
    }

    func testFullSheetPresentation() {
        router.showFullSheet(.someSheet)

        XCTAssertNil(sheetAction)
        XCTAssertNotNil(fullSheetAction)

        router.dismissFullScreenCover()

        XCTAssertNil(sheetAction)
        XCTAssertNil(fullSheetAction)
    }

    func testGoBack() {
        router.navigate(to: .listView)
        router.navigate(to: .listDetailView(text: "Johnny"))

        router.goBack()

        XCTAssertEqual(routeActions, [.listView])
    }

    func testGoBackMultipleTimes() {
        router.navigate(to: .listView)
        router.navigate(to: .listDetailView(text: "Johnny"))
        router.navigate(to: .shareView(text: "Share"))

        router.goBack(2)

        XCTAssertEqual(routeActions, [.listView])
    }

    func testPopToRoot() {
        router.navigate(to: .listView)
        router.navigate(to: .listDetailView(text: "Johnny"))
        router.navigate(to: .shareView(text: "Share"))

        router.goToRoot()

        XCTAssertEqual(routeActions, [])
    }

    private func setUpListening() {
        router.$routes
            .sink { [weak self] in self?.routeActions = $0 }
            .store(in: &cancellables)

        router.$presentedSheet
            .sink { [weak self] in self?.sheetAction = $0 }
            .store(in: &cancellables)

        router.$fullScreenSheet
            .sink { [weak self] in self?.fullSheetAction = $0 }
            .store(in: &cancellables)
    }
}

