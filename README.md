# FHConstraints

<p align="left">
<a href="https://github.com/FelixHerrmann/FHConstraints/releases"><img alt="GitHub version" src="https://img.shields.io/github/v/release/FelixHerrmann/FHConstraints"></a>
<a href="https://github.com/FelixHerrmann/FHConstraints/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/FelixHerrmann/FHConstraints"></a>
<a href="https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHConstraints"><img alt="Twitter" src="https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FFelixHerrmann%2FFHConstraints"></a>
</p>

FHConstraints is an extension for the UIView class with usefull constraint methods.
Theses methods simplify the build-in constraint methods.

## Requirements
- macOS 10.11
- macOS 10.15+ (Catalyst)
- iOS 9.0+
- tvOS 9.0+

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

Add the following to the dependencies of your `Package.swift`:

```swift
.package(url: "https://github.com/FelixHerrmann/FHConstraints.git", from: "x.x.x")
```

### Manual

Download the files in the [Sources](https://github.com/FelixHerrmann/FHConstraints/tree/master/Sources) folder and drag them into you project.

## Usage

If you are using Swift Package Manager, you have to import FHConstraints to your file with `import FHConstraints`.
You can also import it globally with `@_exported import FHConstraints`. (e.g. in `AppDelegate.swift`)

<br>

Instead of: 
```swift
subview.translatesAutoresizingMaskIntoConstraints = false
subview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
subview.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10).isActive = true
subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 5).isActive = true
subview.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 1.5, constant: 20).isActive = true
```

you will use:
```swift
subview.constraint(.leading(to: view.leadingAnchor))
subview.constraint(.trailing(to: view.trailingAnchor, .lessThanOrEqual(to: -10)))
subview.constraint(.centerY(to: view.centerYAnchor, .equal(to: 5)))
subview.constraint(.height(to: view.heightAnchor, .greaterThanOrEqual(to: FHLayoutAnchor.DimensionConstant(multiplier: 1.5, constant: 20))))
```
>All of these methods will return the created constraint.

### Convenience Methods

Combined constraining method:
```swift
subview.constraint([
    .leading(to: view.leadingAnchor),
    .trailing(to: view.trailingAnchor, .lessThanOrEqual(to: -10)),
    .centerY(to: view.centerYAnchor, .equal(to: 5)),
    .height(to: view.heightAnchor, .greaterThanOrEqual(to: FHLayoutAnchor.DimensionConstant(multiplier: 1.5, constant: 20)))
])
```

Shortcut methods:
```swift
subview.constraint(.inside(of: view, insets: .equal(to: EdgeInsets(top: 0, left: 0, bottom: 0, right: 0))))
```
```swift
subview.constraint(.toCenter(of: view, offset: .equal(to: FHConvenienceAnchors.Offset(horizontal: 0, vertical: 0))))
```
```swift
subview.constraint(.size(.equal(to: CGSize(width: 0, height: 0)))
```

## License

FHConstraints is available under the MIT license. See the [LICENSE](https://github.com/FelixHerrmann/FHConstraints/blob/master/LICENSE) file for more info.
