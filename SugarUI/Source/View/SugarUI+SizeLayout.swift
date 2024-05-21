//
//  SugarUI+SizeLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public extension ViewElement {
	@discardableResult
	func matchSize(_ view: ViewElement?,
				   _ sizeVector: SizeVector) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view = view {
			switch (sizeVector.size, sizeVector.constraint) {
			case (.height, let axisConstraint):
				constraint = heightAnchor
					.constraint(to: view.heightAnchor,
								axisConstraint)
			case (.width, let axisConstraint):
				constraint = widthAnchor
					.constraint(to: view.widthAnchor,
								axisConstraint)
			}
		}

		return constraint
	}

	@discardableResult
	func matchSize(_ view: ViewElement?,
				   _ sizeVectors: [SizeVector]) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view = view,
			sizeVectors.count > 0 {
			constraints = SizeConstraints()

			for sizeVector in sizeVectors {
				let constraint = matchSize(view,
										   sizeVector)

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
	func matchSize(_ view: ViewElement?,
				   _ sizes: [Size] = .all,
				   _ constraint: Constraint = .equal) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view = view,
			sizes.count > 0 {
			constraints = SizeConstraints()

			for size in sizes {
				let sizeVector = SizeVector(size,
											constraint)
				let constraint = matchSize(view,
										   sizeVector)

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
	func matchSize(_ view: ViewElement?,
				   _ constraint: Constraint = .equal) -> SizeConstraints? {
		var constraints: SizeConstraints?

		constraints = matchSize(view,
								.all,
								constraint)

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

		if sizeVectors.count > 0 {
			constraints = SizeConstraints()

			for sizeVector in sizeVectors {
				let constraint = fixSize(sizeVector)

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
	func fixSize(_ axes: [Size] = .all,
				 _ constraint: Constraint = .equal) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if axes.count > 0 {
			constraints = SizeConstraints()

			for axis in axes {
				let sizeVector = SizeVector(axis,
											constraint)
				let constraint = fixSize(sizeVector)

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

		let sizeVector = SizeVector(.height,
									sizeConstraint)
		constraint = fixSize(sizeVector)

		return constraint
	}

	@discardableResult
	func height(_ sizeConstraints: [Constraint]) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if sizeConstraints.count > 0 {
			constraints = []

			for sizeConstraint in sizeConstraints {
				let constraint = height(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func width(_ sizeConstraint: Constraint = .equal) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		let sizeVector = SizeVector(.width,
									sizeConstraint)
		constraint = fixSize(sizeVector)

		return constraint
	}

	@discardableResult
	func width(_ sizeConstraints: [Constraint]) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if sizeConstraints.count > 0 {
			constraints = []

			for sizeConstraint in sizeConstraints {
				let constraint = width(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func matchSize(_ view: ViewElement?,
				   _ sizeVector: ViewElement.SizeVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizeVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSize(_ view: ViewElement?,
				   _ sizeVectors: [ViewElement.SizeVector]) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizeVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSize(_ view: ViewElement?,
				   _ sizes: [ViewElement.Size] = .all,
				   _ constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizes)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSizes(_ sizes: [ViewElement.Size] = .all,
					_ constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if sizes.count > 0,
			let firstElement = first {
			constraints = []

			for element in self {
				if element != first {
					let constraint = element?.matchSize(firstElement,
														sizes)
					constraints?.append(constraint)
				}
			}
		}

		return constraints
	}

	@discardableResult
	func fixSize(_ sizeVector: ViewElement.SizeVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.fixSize(sizeVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func fixSize(_ sizeVectors: [ViewElement.SizeVector]) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.fixSize(sizeVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func fixSize(_ sizes: [ViewElement.Size] = .all,
				 _ constraint: ViewElement.Constraint) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if count > 0 {
			constraints = []

			for element in self {
				let fixConstraint = element?.fixSize(sizes,
													 constraint)
				constraints?.append(fixConstraint)
			}
		}

		return constraints
	}

	@discardableResult
	func fixSizes(_ constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if count > 0 {
			constraints = []

			for element in self {
				let fixConstraint = element?.fixSize(.all,
													 constraint)
				constraints?.append(fixConstraint)
			}
		}

		return constraints
	}

	@discardableResult
	func height(_ sizeConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.height(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func width(_ sizeConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.width(sizeConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
