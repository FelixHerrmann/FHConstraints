import XCTest
@testable import FHConstraints
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

final class FHConstraintsTests: XCTestCase {
    func testExample() {
        #if canImport(UIKit)
        let view = UIView()
        let subview = UIView()
        
        view.addSubview(subview)
        XCTAssertNotNil(subview.constraint(.leading(to: view.leadingAnchor)), "Constraint leading constraint successfully.")
        
        #elseif canImport(AppKit)
        let view = NSView()
        let subview = NSView()
        
        view.addSubview(subview)
        XCTAssertNotNil(subview.constraint(.leading(to: view.leadingAnchor)), "Constraint leading constraint successfully.")
        
        #endif
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
