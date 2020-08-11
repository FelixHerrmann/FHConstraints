#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// FHConvenience Anchors
public enum FHConvenienceAnchors {
    /// Constraints the layout item inside of the parsed layout item with optional insets.
    ///
    /// The returned constraint order is: [leading, top, trailing, bottom]
    case inside(of: FHLayoutItem, insets: FHLayoutConstantType<EdgeInsets> = .equal(to: EdgeInsets()))
    
    /// Constraints the layout item to the center of the parsed layout item with optional offset.
    ///
    /// The returned constraint order is: [centerX, centerY]
    case toCenter(of: FHLayoutItem, offset: FHLayoutConstantType<Offset> = .equal(to: Offset()))
    
    /// Constraints the layout item to the parsed size.
    ///
    /// The returned constraint order is: [width, height]
    case size(_ size: FHLayoutConstantType<CGSize>)
}

extension FHConvenienceAnchors {
    
    /// Offset struct
    public struct Offset {
        public var horizontal: CGFloat
        public var vertical: CGFloat
        
        public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
            self.horizontal = horizontal
            self.vertical = vertical
        }
    }
}

extension FHConvenienceAnchors {
    internal func _constraint(layoutItem: FHLayoutItem) -> [NSLayoutConstraint] {
        switch self {
        case .inside(of: let superLayoutItem, insets: let insetsType):
            switch insetsType {
            case .equal(to: let insets):
                return layoutItem.constraint([
                    .leading(to: superLayoutItem.leadingAnchor, .equal(to: insets.left)),
                    .top(to: superLayoutItem.topAnchor, .equal(to: insets.top)),
                    .trailing(to: superLayoutItem.trailingAnchor, .equal(to: -insets.right)),
                    .bottom(to: superLayoutItem.bottomAnchor, .equal(to: -insets.bottom))
                ])
            case .lessThanOrEqual(to: let insets):
                return layoutItem.constraint([
                    .leading(to: superLayoutItem.leadingAnchor, .lessThanOrEqual(to: insets.left)),
                    .top(to: superLayoutItem.topAnchor, .lessThanOrEqual(to: insets.top)),
                    .trailing(to: superLayoutItem.trailingAnchor, .greaterThanOrEqual(to: -insets.right)),
                    .bottom(to: superLayoutItem.bottomAnchor, .greaterThanOrEqual(to: -insets.bottom))
                ])
            case .greaterThanOrEqual(to: let insets):
                return layoutItem.constraint([
                    .leading(to: superLayoutItem.leadingAnchor, .greaterThanOrEqual(to: insets.left)),
                    .top(to: superLayoutItem.topAnchor, .greaterThanOrEqual(to: insets.top)),
                    .trailing(to: superLayoutItem.trailingAnchor, .lessThanOrEqual(to: -insets.right)),
                    .bottom(to: superLayoutItem.bottomAnchor, .lessThanOrEqual(to: -insets.bottom))
                ])
            }
        case .toCenter(of: let superLayoutItem, offset: let offsetType):
            switch offsetType {
            case .equal(to: let offset):
                return layoutItem.constraint([
                    .centerX(to: superLayoutItem.centerXAnchor, .equal(to: offset.horizontal)),
                    .centerY(to: superLayoutItem.centerYAnchor, .equal(to: offset.vertical))
                ])
            case .lessThanOrEqual(to: let offset):
                return layoutItem.constraint([
                    .centerX(to: superLayoutItem.centerXAnchor, .lessThanOrEqual(to: offset.horizontal)),
                    .centerY(to: superLayoutItem.centerYAnchor, .lessThanOrEqual(to: offset.vertical))
                ])
            case .greaterThanOrEqual(to: let offset):
                return layoutItem.constraint([
                    .centerX(to: superLayoutItem.centerXAnchor, .greaterThanOrEqual(to: offset.horizontal)),
                    .centerY(to: superLayoutItem.centerYAnchor, .greaterThanOrEqual(to: offset.vertical))
                ])
            }
        case .size(let sizeType):
            switch sizeType {
            case .equal(to: let size):
                return layoutItem.constraint([
                    .widthConstant(.equal(to: size.width)),
                    .heightConstant(.equal(to: size.height))
                ])
            case .lessThanOrEqual(to: let size):
                return layoutItem.constraint([
                    .widthConstant(.lessThanOrEqual(to: size.width)),
                    .heightConstant(.lessThanOrEqual(to: size.height))
                ])
            case .greaterThanOrEqual(to: let size):
                return layoutItem.constraint([
                    .widthConstant(.greaterThanOrEqual(to: size.width)),
                    .heightConstant(.greaterThanOrEqual(to: size.height))
                ])
            }
        }
    }
}
