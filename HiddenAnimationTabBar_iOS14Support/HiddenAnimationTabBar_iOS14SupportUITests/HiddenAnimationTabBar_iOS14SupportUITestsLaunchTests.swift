//
//  HiddenAnimationTabBar_iOS14SupportUITestsLaunchTests.swift
//  HiddenAnimationTabBar_iOS14SupportUITests
//
//  Created by 武田孝騎 on 2022/09/09.
//

import XCTest

class HiddenAnimationTabBar_iOS14SupportUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
