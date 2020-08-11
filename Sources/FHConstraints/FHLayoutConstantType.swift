
/// FHLayoutConstantType enum
public enum FHLayoutConstantType<T> {
    /// Constraints the layout item exactly to the associated value.
    case equal(to: T)
    
    /// Constraints the layout item up to the associated value.
    case lessThanOrEqual(to: T)
    
    /// Constraints the layout item from the associated value.
    case greaterThanOrEqual(to: T)
}
