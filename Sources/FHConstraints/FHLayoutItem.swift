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
        return _createAndActivateConstraint(fromAnchor: anchor)
    }
    
    /// Creates and activates the constraints from the `anchors` parameter.
    /// - Parameter anchors: The array of anchors from which the constraints should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`s. The order matches the anchors order.
    @discardableResult public func constraint(_ anchors: [FHLayoutAnchor]) -> [NSLayoutConstraint] {
        return anchors.map({ constraint($0) })
    }
    
    /// Creates and activates the from the `convenienceAnchors` parameter defined constraints.
    /// - Parameter convenienceAnchors: The convenciene anchor type.
    /// - Returns: Returns the created `NSLayoutConstraint`s.
    @discardableResult public func constraint(_ convenienceAnchors: FHConvenienceAnchors) -> [NSLayoutConstraint] {
        return convenienceAnchors._constraint(layoutItem: self)
    }
}

extension FHLayoutItem {
    private func _createAndActivateConstraint(fromAnchor anchor: FHLayoutAnchor) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        
        switch anchor {
        case .leading(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = leadingAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = leadingAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = leadingAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .trailing(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = trailingAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = trailingAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = trailingAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .left(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = leftAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = leftAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = leftAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .right(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = rightAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = rightAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = rightAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .top(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = topAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = topAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = topAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .bottom(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = bottomAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = bottomAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = bottomAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .centerX(to: let xAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = centerXAnchor.constraint(equalTo: xAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = centerXAnchor.constraint(lessThanOrEqualTo: xAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = centerXAnchor.constraint(greaterThanOrEqualTo: xAxisAnchor, constant: constant)
            }
        case .centerY(to: let yAxisAnchor, let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = centerYAnchor.constraint(equalTo: yAxisAnchor, constant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = centerYAnchor.constraint(lessThanOrEqualTo: yAxisAnchor, constant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = centerYAnchor.constraint(greaterThanOrEqualTo: yAxisAnchor, constant: constant)
            }
        case .width(to: let dimension, let constantType):
            switch constantType {
            case .equal(to: let dimensionConstant):
                constraint = widthAnchor.constraint(equalTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            case .lessThanOrEqual(to: let dimensionConstant):
                constraint = widthAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            case .greaterThanOrEqual(to: let dimensionConstant):
                constraint = widthAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
            }
        case .widthConstant(let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = widthAnchor.constraint(equalToConstant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        case .height(to: let dimension, let constantType):
        switch constantType {
        case .equal(to: let dimensionConstant):
            constraint = heightAnchor.constraint(equalTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        case .lessThanOrEqual(to: let dimensionConstant):
            constraint = heightAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        case .greaterThanOrEqual(to: let dimensionConstant):
            constraint = heightAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: dimensionConstant.multiplier, constant: dimensionConstant.constant)
        }
        case .heightConstant(let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = heightAnchor.constraint(equalToConstant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }
        
        constraint.isActive = true
        
        return constraint
    }
}
