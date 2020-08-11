#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// FHLayoutAnchor enum
public enum FHLayoutAnchor {
    case leading(to: NSLayoutXAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case trailing(to: NSLayoutXAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case left(to: NSLayoutXAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case right(to: NSLayoutXAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case top(to: NSLayoutYAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case bottom(to: NSLayoutYAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case centerX(to: NSLayoutXAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case centerY(to: NSLayoutYAxisAnchor, _ constantType: FHLayoutConstantType<CGFloat> = .equal(to: 0))
    case width(to: NSLayoutDimension, _ constantType: FHLayoutConstantType<DimensionConstant> = .equal(to: DimensionConstant()))
    case widthConstant(_ constantType: FHLayoutConstantType<CGFloat>)
    case height(to: NSLayoutDimension, _ constantType: FHLayoutConstantType<DimensionConstant> = .equal(to: DimensionConstant()))
    case heightConstant(_ constantType: FHLayoutConstantType<CGFloat>)
}

extension FHLayoutAnchor {
    
    /// DimensionConstant struct
    public struct DimensionConstant {
        public var multiplier: CGFloat
        public var constant: CGFloat
        
        public init(multiplier: CGFloat = 1, constant: CGFloat = 0) {
            self.multiplier = multiplier
            self.constant = constant
        }
    }
}
