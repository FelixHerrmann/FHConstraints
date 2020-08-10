#if canImport(UIKit)
import UIKit

extension UIView: FHAutoLayout {
    public func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILayoutGuide: FHAutoLayout {
    public func enableAutoLayout() { }
}

extension FHAutoLayout {
    typealias EdgeInsets = UIEdgeInsets
}

#elseif canImport(AppKit)
import AppKit

extension NSView: FHAutoLayout {
    public func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension FHAutoLayout {
    typealias EdgeInsets = NSEdgeInsets
}

#endif

/// FHAutoLayout protocol
public protocol FHAutoLayout {
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

extension FHAutoLayout {
    /// Creates and activates the constraint from the `anchor` parameter.
    /// - Parameter anchor: The anchor from which the constraint should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`.
    @discardableResult public func constraint(_ anchor: FHLayoutAnchor) -> NSLayoutConstraint {
        enableAutoLayout()
        return _createAndActivateConstraint(fromAnchor: anchor)
    }
    
    /// Creates and activates the constraints from the `anchor` parameter.
    /// - Parameter anchors: The array of anchors from which the constraints should be created.
    /// - Returns: Returns the created `NSLayoutConstraint`s. The order matches the anchors order.
    @discardableResult public func constraint(_ anchors: [FHLayoutAnchor]) -> [NSLayoutConstraint] {
        return anchors.map({ constraint($0) })
    }
}

extension FHAutoLayout {
    /// Centers this view to the parsed view.
    /// - Parameter view: View to constraint to.
    /// - Returns: Returns all created constraints in the following order: [centerX, centerY]
    @discardableResult func constraint(toCenterOf view: FHAutoLayout) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(constraint(.centerX(to: view.centerXAnchor)))
        constraints.append(constraint(.centerY(to: view.centerYAnchor)))
        
        return constraints
    }
    
    /// Constraints the view on top of the parsed view.
    /// - Parameter view: The view to constraint to.
    /// - Parameter inset: Inset arround the view.
    /// - Returns: Returns all created constraints in the following order: [leading, top, trailing, bottom]
    @discardableResult func constraint(onTopOf view: FHAutoLayout, inset: EdgeInsets = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(constraint(.leading(to: view.leadingAnchor, .equal(to: inset.left))))
        constraints.append(constraint(.top(to: view.topAnchor, .equal(to: inset.top))))
        constraints.append(constraint(.trailing(to: view.trailingAnchor, .equal(to: -inset.right))))
        constraints.append(constraint(.bottom(to: view.bottomAnchor, .equal(to: -inset.bottom))))
        
        return constraints
    }
}

extension FHAutoLayout {
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
        case .widthTo(let dimension, let dimensionConstantType):
            switch dimensionConstantType {
            case .equalTo(multiplier: let multiplier, constant: let constant):
                constraint = widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant)
            case .lessThanOrEqualTo(multiplier: let multiplier, constant: let constant):
                constraint = widthAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqualTo(multiplier: let multiplier, constant: let constant):
                constraint = widthAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: constant)
            }
        case .width(let constantType):
            switch constantType {
            case .equal(to: let constant):
                constraint = heightAnchor.constraint(equalToConstant: constant)
            case .lessThanOrEqual(to: let constant):
                constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .greaterThanOrEqual(to: let constant):
                constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        case .heightTo(let dimension, let dimensionConstantType):
            switch dimensionConstantType {
            case .equalTo(multiplier: let multiplier, constant: let constant):
                constraint = heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant)
            case .lessThanOrEqualTo(multiplier: let multiplier, constant: let constant):
                constraint = heightAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqualTo(multiplier: let multiplier, constant: let constant):
                constraint = heightAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: constant)
            }
        case .height(let constantType):
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
