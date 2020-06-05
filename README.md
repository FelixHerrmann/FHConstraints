# FHConstraints

FHConstraints is an extension for the UIView class with usefull constraint methodes.

Theses methodes simplify the build-in constraint methodes.

## Usage

Instead of: 
```swift
view.translatesAutoresizingMaskIntoConstraints = true
view.leadingAnchor.constraint(equalTo: subview.leadingAnchor).isActive = true
```

you will use:
```swift
view.constraintLeading(to: subview.leadingAnchor)
```
