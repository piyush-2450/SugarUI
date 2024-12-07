//
//  UISwift+SizeLayout.swift
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

// swiftlint:disable discouraged_optional_collection file_length
public extension ViewElement {
	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ sizeVector: SizeVector
	) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view {
			switch (sizeVector.size, sizeVector.constraint) {
			case (.height, let axisConstraint):
				constraint = heightAnchor
					.constraint(
						to: view.heightAnchor,
						axisConstraint
					)

			case (.width, let axisConstraint):
				constraint = widthAnchor
					.constraint(
						to: view.widthAnchor,
						axisConstraint
					)
			}
		}

		return constraint
	}

	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ sizeVectors: [SizeVector]
	) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view,
		   sizeVectors.isEmpty == false {
			constraints = SizeConstraints()

			for sizeVector in sizeVectors {
				let constraint: LayoutConstraint? = matchSize(
					view,
					sizeVector
				)

				switch sizeVector.size {
				case .height:
					constraints?.height = constraint

				case .width:
					constraints?.width = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ sizes: [Size] = .all,
		_ constraint: Constraint = .equal
	) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view,
		   sizes.isEmpty == false {
			constraints = SizeConstraints()

			for size in sizes {
				let sizeVector: SizeVector = SizeVector(
					size,
					constraint
				)
				let constraint: LayoutConstraint? = matchSize(
					view,
					sizeVector
				)

				switch sizeVector.size {
				case .height:
					constraints?.height = constraint

				case .width:
					constraints?.width = constraint
				}
			}
		}

		return constraints
	}

	@inlinable
	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ constraint: Constraint = .equal
	) -> SizeConstraints? {
		var constraints: SizeConstraints?

		constraints = matchSize(
			view,
			.all,
			constraint
		)

		return constraints
	}

	@discardableResult
	func fixSize(_ sizeVector: SizeVector) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		switch (sizeVector.size, sizeVector.constraint) {
		case (.height, let axisConstraint):
			constraint = heightAnchor
				.constraint(axisConstraint)

		case (.width, let axisConstraint):
			constraint = widthAnchor
				.constraint(axisConstraint)
		}

		return constraint
	}

	@discardableResult
	func fixSize(_ sizeVectors: [SizeVector]) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if sizeVectors.isEmpty == false {
			constraints = SizeConstraints()

			for sizeVector in sizeVectors {
				let constraint: LayoutConstraint? = fixSize(sizeVector)

				switch sizeVector.size {
				case .height:
					constraints?.height = constraint

				case .width:
					constraints?.width = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func fixSize(
		_ axes: [Size] = .all,
		_ constraint: Constraint = .equal
	) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if axes.isEmpty == false {
			constraints = SizeConstraints()

			for axis in axes {
				let sizeVector: SizeVector = SizeVector(
					axis,
					constraint
				)
				let constraint: LayoutConstraint? = fixSize(sizeVector)

				switch sizeVector.size {
				case .height:
					constraints?.height = constraint

				case .width:
					constraints?.width = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func height(_ sizeConstraint: Constraint = .equal) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		let sizeVector: SizeVector = SizeVector(
			.height,
			sizeConstraint
		)
		constraint = fixSize(sizeVector)

		return constraint
	}

	@inlinable
	@discardableResult
	func height(_ sizeConstraints: [Constraint]) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if sizeConstraints.isEmpty == false {
			constraints = []

			for sizeConstraint in sizeConstraints {
				let constraint: LayoutConstraint? = height(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func width(_ sizeConstraint: Constraint = .equal) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		let sizeVector: SizeVector = SizeVector(
			.width,
			sizeConstraint
		)
		constraint = fixSize(sizeVector)

		return constraint
	}

	@inlinable
	@discardableResult
	func width(_ sizeConstraints: [Constraint]) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if sizeConstraints.isEmpty == false {
			constraints = []

			for sizeConstraint in sizeConstraints {
				let constraint: LayoutConstraint? = width(sizeConstraint)
				constraints?.append(constraint)
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
	func matchSize(
		_ view: ViewElement?,
		_ sizeVector: ViewElement.SizeVector
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view,
		   isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.matchSize(
						view,
						sizeVector
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ sizeVectors: [ViewElement.SizeVector]
	) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view,
		   isEmpty == false {
			constraints = []

			for element in self {
				let constraint: ViewElement.SizeConstraints? = element?
					.matchSize(
						view,
						sizeVectors
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func matchSize(
		_ view: ViewElement?,
		_ sizes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view,
		   isEmpty == false {
			constraints = []

			for element in self {
				let constraint: ViewElement.SizeConstraints? = element?
					.matchSize(
						view,
						sizes
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func matchSizes(
		_ sizes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if sizes.isEmpty == false,
		   let firstElement = first {
			constraints = []

			for element in self where element != first {
				let constraint: ViewElement.SizeConstraints? = element?
					.matchSize(
						firstElement,
						sizes
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func fixSize(_ sizeVector: ViewElement.SizeVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.fixSize(sizeVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func fixSize(_ sizeVectors: [ViewElement.SizeVector]) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let constraint: ViewElement.SizeConstraints? = element?
					.fixSize(sizeVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	// swiftlint:disable function_default_parameter_at_end
	@MainActor
	@inlinable
	@discardableResult
	func fixSize(
		_ sizes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint
	) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let fixConstraint: ViewElement.SizeConstraints? = element?
					.fixSize(
						sizes,
						constraint
					)
				constraints?.append(fixConstraint)
			}
		}

		return constraints
	}
	// swiftlint:enable function_default_parameter_at_end

	@MainActor
	@inlinable
	@discardableResult
	func fixSizes(_ constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let fixConstraint: ViewElement.SizeConstraints? = element?
					.fixSize(
						.all,
						constraint
					)
				constraints?.append(fixConstraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func height(_ sizeConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.height(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func width(_ sizeConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.width(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
// swiftlint:enable discouraged_optional_collection file_length
