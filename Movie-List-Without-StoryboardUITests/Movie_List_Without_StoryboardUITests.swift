//
//  Movie_List_Without_StoryboardUITests.swift
//  Movie-List-Without-StoryboardUITests
//
//  Created by iOS on 31/5/22.
//

import XCTest

class Movie_List_Without_StoryboardUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
     
    /// Move table view.
    func testTableView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables.containing(.table, identifier: "MoveTableView")
        
        XCTAssertTrue(tableView.cells.count > 0, "Empty table view. Doesn't fetch table view data!")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
