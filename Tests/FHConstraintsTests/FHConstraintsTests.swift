import XCTest
import UIKit
@testable import FHConstraints

final class FHConstraintsTests: XCTestCase {
    func testExample() {
        let view = UIView()
        let subview = UIView()
        
        view.addSubview(subview)
        
        XCTAssertNotNil(subview.constraint(leading: view.leadingAnchor).leadingConstraint, "Constraint leading constraint successfully.")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
