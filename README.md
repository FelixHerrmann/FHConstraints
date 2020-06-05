# FHConstraints

<p align="left">
<a href="https://github.com/FelixHerrmann/FHConstraints/releases"><img alt="GitHub version" src="https://img.shields.io/github/v/release/FelixHerrmann/FHConstraints"></a>
<a href="https://github.com/FelixHerrmann/FHConstraints/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/FelixHerrmann/FHConstraints"></a>
<a href="https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHConstraints"><img alt="Twitter" src="https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2FFlxHrrmnn"></a>
</p>

FHConstraints is an extension for the UIView class with usefull constraint methodes.
Theses methodes simplify the build-in constraint methodes.

## Usage

Instead of: 
```swift
subview.translatesAutoresizingMaskIntoConstraints = true
subview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
subview.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10).isActive = true
subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 5).isActive = true
subview.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 1.5, constant: 20).isActive = true
```

you will use:
```swift
subview.constraintLeading(to: view.leadingAnchor)
subview.constraintTrailing(to: view.trailingAnchor, constant: -10, type: .lessThanOrEqualTo)
subview.constraintCenterY(to: view.centerYAnchor, constant: 5)
subview.constraintHeight(to: view.heightAnchor, multiplier: 1.5, constant: 20, type: .greaterThanOrEqualTo)
```
>All of theses methodes will return the created constraint.

### Convenience Methodes

Combined constraining methode:
```swift
subview.constraint(
    leading: view.leadingAnchor, leadingConstant: 10,
    top: view.topAnchor,
    trailing: view.trailingAnchor, trailingConstant: -10,
    bottom: view.bottomAnchor, bottomConstant: -20,
    width: 30, height: 30
)
```

Shortcut methodes:
```swift
subview.constraint(toCenterOf: view)
```
```swift
subview.constraint(onTopOf: view)
```

Different constraint system:
```swift
subview.constraint(
    to: view,
    onSide: .left,
    spacing: 10,
    position: .firstCorner,
    size: CGSize(width: 10, height: 10),
    equalDimension: false
)
```

## License

FHConstraints is available under the MIT license. See the [LICENSE](https://github.com/FelixHerrmann/FHConstraints/blob/master/LICENSE) file for more info.
