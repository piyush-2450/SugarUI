# UISwift

UISwift streamlines programmatic UI development for iOS and macOS by providing expressive, optional-friendly Swift APIs. It brings the declarative syntax of SwiftUI to UIKit and AppKit, ensuring robust performance and consistent behavior.

## Features

- **Declarative Syntax**: Build UIs with clear and concise code, mirroring SwiftUI's declarative style.
- **Optional-Friendly APIs**: Seamlessly integrate with optional types, reducing the need for unwrapping.
- **Automatic Constraint Management**: Simplify Auto Layout with intuitive methods for embedding, stacking, and centering views.
- **Cross-Platform Support**: Utilize UISwift for both iOS (UIKit) and macOS (AppKit) development.

## Installation

Add UISwift to your project using Swift Package Manager:

1. In Xcode, navigate to **File > Add Packages**.
2. Enter the repository URL: `https://github.com/piyush-2450/UISwift.git`.
3. Select the latest version and add the package to your project.

## Getting Started

Here's how to leverage UISwift for building UIs programmatically. Let's consider the following views to explore UIView sweetness provided by UISwift:

```swift
// Superview
var superview: UIView?

// Subviews
var subview1: UIView?
var subview2: UIView?
var subview3: UIView?
var subview4: UIView?
```

## View instantiation

Easy & clean instantiation. Create views effortlessly with sensible default properties. No need to specify frame, color etc.
```swift
// Instantiation
superview = .instance()
```

Instantiation using ```instance()``` ensures that the following properties are set by default in the newly created instance
```swift
frame = .zero
translatesAutoresizingMaskIntoConstraints = false
clipsToBounds = true
backgroundColor = .clear
```

## Subview addition

Adding a subview to a superview's hierarchy:

```swift
// Adding one subview
superview?.add(subview1)

// Adding multiple subviews
superview?.add([subview1, subview2])
```

Adding a subview & setting the leading, trailing, top & bottom edges to a superview's hierarchy (Embedding):

```swift
// Embedding a subview with a padding of >=20 for all edges to the superview
superview?.embed(subview1, >-20)
```

Stacking subviews into a superview's hierarchy:

```swift
// Stacking vertically with an inter subview spacing of >=20 points
superview?.embed([subview1, subview2], .vertical(>-20))
```

## View chaining

Views can be easily chained vertically or horizontally.

```swift
// Chaining views vertically with an inter subview spacing of >=20 points
UIView.chain([subview1, subview2, subview3], .vertical(>-20))
// OR
subview1?.chain(subview2, .vertical(>-20))
subview2?.chain(subview3, .vertical(>-20))
```

## View centering

Views can be easily centered vertically and/or horizontally.

```swift
// Center vertically & horizontally in superview
superview?.center(subview1)

// Center align subviews along the Y axis with an offset of 20 points
superview?.center([subview1, subview2], .vertical(20))

// Center align two non-hierarchical views
subview1?.center(subview2)
```

## View size manipulation

View size can be easily set as follows.

```swift
// Adds a height <= 20 points constraint on a view
subview1?.height(-<20)

// Adds a height <=10 points and height <=20 points constraints on a view
subview1?.height([>-10, -<20])
```

View size relations can be setup easily as follows:

```swift
// Ensure subview2 has the same height & width as subview1
subview2?.matchSize(subview1)

// Ensure subview2 has a height & width equal to subview1 with an offset of 20 points
subview2?.matchSize(subview1, 20)
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

By adopting UISwift, you can build dynamic, programmatic UIs with the simplicity of SwiftUI while maintaining the reliability and performance of UIKit and AppKit.
