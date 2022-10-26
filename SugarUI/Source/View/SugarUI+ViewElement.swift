//
//  SugarUI+ViewElement.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
    var colorBackground: ViewColor {
        get {
#if canImport(UIKit)
            backgroundColor
#else
            .clear
#endif
        }
        set {
#if canImport(UIKit)
            backgroundColor = newVale
#else
            //
#endif
        }
    }

	static func instance() -> Self {
		func instance<T: ViewElement>() -> T {
			let instance = T(frame: .zero)
			instance.translatesAutoresizingMaskIntoConstraints = false
#if canImport(UIKit)
			instance.clipsToBounds = true
			instance.backgroundColor = .clear
#endif
			return instance
		}

		return instance()
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	func backgroundColor(_ color: ViewColor?) {
#if canImport(UIKit)
		for element in self {
			element?.backgroundColor = color
		}
#endif
	}

	func backgroundColor(_ colors: [ViewColor]) {
#if canImport(UIKit)
		for (element, color) in zip(self, colors) {
			element?.backgroundColor = color
		}
#endif
	}
}
