#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// FHLayoutAnchor enum
public enum FHLayoutAnchor: Hashable {
    
    /// ConstantType enum
    public enum ConstantType: Hashable {
        case equal(to: CGFloat)
        case lessThanOrEqual(to: CGFloat)
        case greaterThanOrEqual(to: CGFloat)
    }
    
    /// DimensionConstantType enum
    public enum DimensionConstantType: Hashable {
        case equalTo(multiplier: CGFloat = 1, constant: CGFloat = 0)
        case lessThanOrEqualTo(multiplier: CGFloat = 1, constant: CGFloat = 0)
        case greaterThanOrEqualTo(multiplier: CGFloat = 1, constant: CGFloat = 0)
    }
    
    case leading(to: NSLayoutXAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case trailing(to: NSLayoutXAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case left(to: NSLayoutXAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case right(to: NSLayoutXAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case top(to: NSLayoutYAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case bottom(to: NSLayoutYAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case centerX(to: NSLayoutXAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case centerY(to: NSLayoutYAxisAnchor, _ constantType: ConstantType = .equal(to: 0))
    case widthTo(NSLayoutDimension, _ constantType: DimensionConstantType = .equalTo())
    case width(_ constantType: ConstantType)
    case heightTo(NSLayoutDimension, _ constantType: DimensionConstantType = .equalTo())
    case height(_ constantType: ConstantType)
}
