//
//  UISwift+ViewElement.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif os(OSX)
import AppKit
#endif

extension ViewElement: @preconcurrency UISwiftView {
	//
}

public extension ViewElement {
	@inlinable
	var bgColor: ViewColor? {
		get {
#if canImport(UIKit)
			backgroundColor
#else
			nil
#endif
		}
		set {
#if canImport(UIKit)
			backgroundColor = newValue
#else
			//
#endif
		}
	}

	@inlinable
	static func instance() -> Self {
		func instance<T: ViewElement>() -> T {
			let instance: T = T(frame: .zero)
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
	@MainActor
	@inlinable
	func backgroundColor(_ color: ViewColor?) {
#if canImport(UIKit)
		for element in self {
			element?.backgroundColor = color
		}
#endif
	}

	@MainActor
	@inlinable
	func backgroundColor(_ colors: [ViewColor]) {
#if canImport(UIKit)
		for (element, color) in zip(self, colors) {
			element?.backgroundColor = color
		}
#endif
	}
}
