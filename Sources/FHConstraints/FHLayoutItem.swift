#if canImport(UIKit)
import UIKit

public typealias EdgeInsets = UIEdgeInsets

extension UIView: FHLayoutItem {
    public func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILayoutGuide: FHLayoutItem {
    public func enableAutoLayout() { }
}

#elseif canImport(AppKit)
import AppKit

public typealias EdgeInsets = NSEdgeInsets

extension NSView: FHLayoutItem {
    public func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NSLayoutGuide: FHLayoutItem {
    public func enableAutoLayout() { }
}

#endif

/// FHAutoLayout protocol
public protocol FHLayoutItem {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
    /// Enable AutoLayout on `Self`.
    func enableAutoLayout()
}

extension FHLayoutItem {
    
    /// Creates and activates the constraint from the `anchor` parameter.
    /// - Parameter anchor: The anchor from which the constraint should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`.
    @discardableResult public func constraint(_ anchor: FHLayoutAnchor) -> NSLayoutConstraint {
        enableAutoLayout()
        let constraint = _createConstraint(fromAnchor: anchor)
        constraint.isActive = true
        return constraint
    }
    
    /// Creates and activates the constraints from the `anchors` parameter.
    /// - Parameter anchors: The array of anchors from which the constraints should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`s. The order matches the anchors order.
    @discardableResult public func constraint(_ anchors: [FHLayoutAnchor]) -> [NSLayoutConstraint] {
        return anchors.map { constraint($0) }
    }
    
    /// Creates and activates the from the `convenienceAnchors` parameter defined constraints.
    /// - Parameter convenienceAnchors: The convenience anchor type.
    /// - Returns: Returns the created `NSLayoutConstraint`s.
    @discardableResult public func constraint(_ convenienceAnchors: FHConvenienceAnchors) -> [NSLayoutConstraint] {
        return convenienceAnchors._constraint(layoutItem: self)
    }
    
    /// Creates the constraint from the `anchor` parameter.
    ///
    /// This method only creates but not activates the `NSLayoutConstraint`.
    /// - Parameter anchor: The anchor from which the constraint should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`.
    public func createConstraint(from anchor: FHLayoutAnchor) -> NSLayoutConstraint {
        enableAutoLayout()
        return _createConstraint(fromAnchor: anchor)
    }
}

extension FHLayoutItem {
    
    private func _createConstraint(fromAnchor anchor: FHLayoutAnchor) -> NSLayoutConstraint {
        switch anchor {
        case .leading(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return leadingAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return leadingAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return leadingAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .trailing(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return trailingAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return trailingAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return trailingAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .left(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return leftAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return leftAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return leftAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .right(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return rightAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return rightAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return rightAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .top(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return topAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return topAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return topAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .bottom(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return bottomAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return bottomAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return bottomAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .centerX(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return centerXAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return centerXAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return centerXAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .centerY(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                return centerYAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                return centerYAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                return centerYAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .width(to: let dimension, let constantType):
            switch constantType {
            case .equal(to: let dimensionConstant):
                return widthAnchor.constraint(equalTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            case .lessThanOrEqual(to: let dimensionConstant):
                return widthAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            case .greaterThanOrEqual(to: let dimensionConstant):
                return widthAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            }
        case .widthConstant(let constantType):
            switch constantType {
            case .equal(to: let constant):
                return widthAnchor.constraint(equalToConstant: constant)
            case .lessThanOrEqual(to: let constant):
                return widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .greaterThanOrEqual(to: let constant):
                return widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        case .height(to: let dimension, let constantType):
        switch constantType {
        case .equal(to: let dimensionConstant):
            return heightAnchor.constraint(equalTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        case .lessThanOrEqual(to: let dimensionConstant):
            return heightAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        case .greaterThanOrEqual(to: let dimensionConstant):
            return heightAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        }
        case .heightConstant(let constantType):
            switch constantType {
            case .equal(to: let constant):
                return heightAnchor.constraint(equalToConstant: constant)
            case .lessThanOrEqual(to: let constant):
                return heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .greaterThanOrEqual(to: let constant):
                return heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }
    }
}
