import XCTest
@testable import FHConstraints
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

final class FHConstraintsTests: XCTestCase {
    
    func testView() {
        #if canImport(UIKit)
        let view = UIView()
        let subview = UIView()
        
        view.addSubview(subview)
        
        XCTAssertNotNil(subview.constraint(.leading(to: view.leadingAnchor)), "Constraint view's leading constraint successfully.")
        
        #elseif canImport(AppKit)
        let view = NSView()
        let subview = NSView()
        
        view.addSubview(subview)
        
        XCTAssertNotNil(subview.constraint(.leading(to: view.leadingAnchor)), "Constraint view's leading constraint successfully.")
        
        #endif
    }
    
    func testLayoutGuide() {
        #if canImport(UIKit)
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        
        view.addLayoutGuide(layoutGuide)
        
        XCTAssertNotNil(layoutGuide.constraint(.leading(to: view.leadingAnchor)), "Constraint layoutGuide's leading constraint successfully.")
        
        #elseif canImport(AppKit)
        let view = NSView()
        let layoutGuide = NSLayoutGuide()
        
        view.addLayoutGuide(layoutGuide)
        
        XCTAssertNotNil(layoutGuide.constraint(.leading(to: view.leadingAnchor)), "Constraint layoutGuide's leading constraint successfully.")
        
        #endif
    }
}
