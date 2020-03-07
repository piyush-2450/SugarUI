//
//  SugarUI+ViewElement.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	static func instance() -> Self {
		func instance<T: ViewElement>() -> T {
			let instance = T(frame: .zero)
			instance.translatesAutoresizingMaskIntoConstraints = false
			instance.clipsToBounds = true
			instance.backgroundColor = .clear
			return instance
		}

		return instance()
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	func backgroundColor(_ color: ViewColor?) {
		for element in self {
			element?.backgroundColor = color
		}
	}

	func backgroundColor(_ colors: [ViewColor]) {
		for (element, color) in zip(self, colors) {
			element?.backgroundColor = color
		}
	}
}
