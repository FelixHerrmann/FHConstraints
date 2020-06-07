import UIKit

public extension UIView {
    /// Describes how the constant is used by the constraint.
    enum ConstraintConstantType {
        case lessThanOrEqualTo, equalTo, greaterThanOrEqualTo
    }
    
    /// Constraints the leading anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintLeading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        leadingConstraint.isActive = true
        
        return leadingConstraint
    }
    
    /// Constraints the top anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintTop(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.topAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        topConstraint.isActive = true
        
        return topConstraint
    }
    
    /// Constraints the trailing anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintTrailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.trailingAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        trailingConstraint.isActive = true
        
        return trailingConstraint
    }
    
    /// Constraints the bottom anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintBottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        bottomConstraint.isActive = true
        
        return bottomConstraint
    }
    
    /// Constraints the centerX anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintCenterX(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let centerXConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.centerXAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        centerXConstraint.isActive = true
        
        return centerXConstraint
    }
    
    /// Constraints the centerY anchor from it's view to another anchor with optional constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintCenterY(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let centerYConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .equalTo:
                return self.centerYAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo:
                return self.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            }
        }()
        
        centerYConstraint.isActive = true
        
        return centerYConstraint
    }
    
    /// Constraints the width anchor from it's view to another anchor with optional multiplier and constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - multiplier: The multiplier constant for the constraint. The default value is 1.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintWidth(to anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            case .equalTo:
                return self.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqualTo:
                return self.widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            }
        }()
        
        widthConstraint.isActive = true
        
        return widthConstraint
    }
    
    /// Constraints the width anchor from it's view to a constant.
    /// - Parameters:
    ///   - constant: The constant width for the view.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintWidth(to constant: CGFloat, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .equalTo:
                return self.widthAnchor.constraint(equalToConstant: constant)
            case .greaterThanOrEqualTo:
                return self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }()
        
        widthConstraint.isActive = true
        
        return widthConstraint
    }
    
    /// Constraints the height anchor from it's view to another anchor with optional multiplier and constant.
    /// - Parameters:
    ///   - anchor: Subclassed NSLayoutAnchor where you want to constraint to.
    ///   - multiplier: The multiplier constant for the constraint. The default value is 1.
    ///   - constant: The constant offset for the constraint. The default value is 0.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintHeight(to anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.heightAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            case .equalTo:
                return self.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
            case .greaterThanOrEqualTo:
                return self.heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            }
        }()
        
        heightConstraint.isActive = true
        
        return heightConstraint
    }
    
    /// Constraints the height anchor from it's view to a constant.
    /// - Parameters:
    ///   - constant: The constant height for the view.
    ///   - type: The type of constant. The default value is .equalTo.
    ///
    /// - Returns: Returns the created constraint.
    @discardableResult func constraintHeight(to constant: CGFloat, type: ConstraintConstantType = .equalTo) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint: NSLayoutConstraint = {
            switch type {
            case .lessThanOrEqualTo:
                return self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .equalTo:
                return self.heightAnchor.constraint(equalToConstant: constant)
            case .greaterThanOrEqualTo:
                return self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }()
        
        heightConstraint.isActive = true
        
        return heightConstraint
    }
    
    
    /// Contains all constraints a view can have.
    struct ViewConstraints {
        public var leadingConstraint: NSLayoutConstraint?
        public var topConstraint: NSLayoutConstraint?
        public var trailingConstraint: NSLayoutConstraint?
        public var bottomConstraint: NSLayoutConstraint?
        public var centerXConstraint: NSLayoutConstraint?
        public var centerYConstraint: NSLayoutConstraint?
        public var widhtConstraint: NSLayoutConstraint?
        public var heightConstraint: NSLayoutConstraint?
        
        public var all: [NSLayoutConstraint?] {
            return [
                leadingConstraint,
                topConstraint,
                trailingConstraint,
                bottomConstraint,
                centerXConstraint,
                centerYConstraint,
                widhtConstraint,
                heightConstraint
            ]
        }
    }
    
    /// Constraints the common layout anchors. Set anchor parameters to nil if you don't need them.
    /// - Parameters:
    ///   - leading: Subclassed NSLayoutAnchor where you want to constraint view's leading anchor to.
    ///   - leadingConstant: The constant offset for the leading constraint. The default value is 0.
    ///   - top: Subclassed NSLayoutAnchor where you want to constraint view's top anchor to.
    ///   - topConstant: The constant offset for the top constraint. The default value is 0.
    ///   - trailing: Subclassed NSLayoutAnchor where you want to constraint view's trailing anchor to.
    ///   - trailingConstant: The constant offset for the trailing constraint. The default value is 0.
    ///   - bottom: Subclassed NSLayoutAnchor where you want to constraint view's bottom anchor to.
    ///   - bottomConstant: The constant offset for the bottom constraint. The default value is 0.
    ///   - width: The view's width anchor constant. Setting the value to nil will not create width anchor.
    ///   - height: The view's height anchro constant. Setting the value to nil will not create height anchor.
    ///
    /// - Returns: Returns all created constraints.
    @discardableResult func constraint(
        leading: NSLayoutXAxisAnchor? = nil, leadingConstant: CGFloat = 0,
        top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0,
        trailing: NSLayoutXAxisAnchor? = nil, trailingConstant: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0,
        width: CGFloat? = nil, height: CGFloat? = nil
    ) -> ViewConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = ViewConstraints()
        
        if let leading = leading {
            constraints.leadingConstraint = self.constraintLeading(to: leading, constant: leadingConstant)
        }
        
        if let top = top {
            constraints.topConstraint = self.constraintTop(to: top, constant: topConstant)
        }
        
        if let trailing = trailing {
            constraints.trailingConstraint = self.constraintTrailing(to: trailing, constant: trailingConstant)
        }
        
        if let bottom = bottom {
            constraints.bottomConstraint = self.constraintBottom(to: bottom, constant: bottomConstant)
        }
        
        if let width = width {
            constraints.widhtConstraint = self.constraintWidth(to: width)
        }
        
        if let height = height {
            constraints.heightConstraint = self.constraintHeight(to: height)
        }
        
        return constraints
    }
    
    
    /// Centers this view to the parsed view.
    /// - Parameter view: View to constraint to.
    ///
    /// - Returns: Returns all created constraints.
    @discardableResult func constraint(toCenterOf view: UIView) -> ViewConstraints {
        var constraints = ViewConstraints()
        
        constraints.centerXConstraint = self.constraintCenterX(to: view.centerXAnchor)
        constraints.centerYConstraint = self.constraintCenterY(to: view.centerYAnchor)
        
        return constraints
    }
    
    /// Constraints the view on top of the parsed view.
    /// - Parameter view: View to constraint to.
    /// - Parameter inset: Inset arround the view.
    ///
    /// - Returns: Returns all created constraints.
    @discardableResult func constraint(onTopOf view: UIView, inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> ViewConstraints {
        var constraints = ViewConstraints()
        
        constraints.leadingConstraint = self.constraintLeading(to: view.leadingAnchor, constant: inset.left)
        constraints.topConstraint = self.constraintTop(to: view.topAnchor, constant: inset.top)
        constraints.trailingConstraint = self.constraintTrailing(to: view.trailingAnchor, constant: -inset.right)
        constraints.bottomConstraint = self.constraintBottom(to: view.bottomAnchor, constant: -inset.bottom)
        
        return constraints
    }
    
    
    /// The side where you want to constraint your view to.
    enum ViewConstraintSide {
        case top, left, bottom, right
    }
    
    /// The position where you want to constraint your view to.
    enum ViewConstraintPosition {
        case firstCorner, center, secondCorner
    }
    
    /// Constraints view to side of the parsed view.
    /// - Parameters:
    ///   - view: View to constraint to.
    ///   - side: Side of the view to constraint to.
    ///   - spacing: Spacing between the views. Default value is 0.
    ///   - position: Constraint position. Default state is firstConrer.
    ///   - size: You can optionally give the view a size. Default value is nil.
    ///   - equalDimension: By setting this value to true, the view get's the same size. The size parameter is then ignored. Default value is false.
    func constraint(to view: UIView, onSide side: ViewConstraintSide, spacing: CGFloat = 0, position: ViewConstraintPosition = .firstCorner, size: CGSize? = nil, equalDimension: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let size = size, !equalDimension {
            self.constraintWidth(to: size.width)
            self.constraintHeight(to: size.height)
        }
        
        switch side {
        case .top, .bottom:
            if side == .top {
                self.constraintBottom(to: view.topAnchor, constant: -spacing)
            }
            if side == .bottom {
                self.constraintTop(to: view.bottomAnchor, constant: spacing)
            }
            
            if equalDimension {
                self.constraint(
                    leading: view.leadingAnchor,
                    trailing: view.trailingAnchor
                )
                self.constraintHeight(to: view.heightAnchor)
            } else {
                switch position {
                case .firstCorner:
                    self.constraintLeading(to: view.leadingAnchor)
                case .center:
                    self.constraintCenterX(to: view.centerXAnchor)
                case .secondCorner:
                    self.constraintTrailing(to: view.trailingAnchor)
                }
            }
        case .left, .right:
            if side == .left {
                self.constraintTrailing(to: view.leadingAnchor, constant: -spacing)
            }
            if side == .right {
                self.constraintLeading(to: view.trailingAnchor, constant: spacing)
            }
            
            if equalDimension {
                self.constraint(
                    top: view.topAnchor,
                    bottom: view.bottomAnchor
                )
                self.constraintWidth(to: view.widthAnchor)
            } else {
                switch position {
                case .firstCorner:
                    self.constraintTop(to: view.topAnchor)
                case .center:
                    self.constraintCenterY(to: view.centerYAnchor)
                case .secondCorner:
                    self.constraintBottom(to: view.bottomAnchor)
                }
            }
        }
    }
}
