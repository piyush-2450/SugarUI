//
//  UISwift+ChainLayout.swift
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

// swiftlint:disable discouraged_optional_collection
public extension ViewElement {
	@discardableResult
	func chain(
		_ view: ViewElement?,
		_ chainVector: ChainVector
	) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view {
			switch chainVector.direction {
			case .vertical:
				constraint = view.headAnchor
					.constraint(
						to: footAnchor,
						chainVector.constraint
					)

			case .horizontal:
				constraint = view.leadAnchor
					.constraint(
						to: trailAnchor,
						chainVector.constraint
					)
			}
		}

		return constraint
	}

	@inlinable
	@discardableResult
	class func chain(
		_ views: [ViewElement?]?,
		_ chainVector: ChainVector
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let views,
		   views.isEmpty == false {
			constraints = []
			var previousView: ViewElement?

			for view in views {
				if let previousView {
					let constraint: LayoutConstraint? = previousView
						.chain(
							view,
							chainVector
						)
					constraints?.append(constraint)
				}

				previousView = view
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@MainActor
	@inlinable
	@discardableResult
	func chain(
		_ view: ViewElement?,
		_ chainVector: ViewElement.ChainVector
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view,
		   isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.chain(
						view,
						chainVector
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
// swiftlint:enable discouraged_optional_collection
