//
//  SugarUI+SizeLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 05-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func matchSize(_ view: ViewElement?,
				   sizeVector: SizeVector) -> LayoutConstraint? {
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
				   sizeVectors: [SizeVector]) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view = view,
			sizeVectors.count > 0 {
			constraints = SizeConstraints()

			for sizeVector in sizeVectors {
				let constraint = matchSize(view,
										   sizeVector: sizeVector)

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
				   sizes: [Size] = Size.all,
				   constraint: Constraint = .equal) -> SizeConstraints? {
		var constraints: SizeConstraints?

		if let view = view,
			sizes.count > 0 {
			constraints = SizeConstraints()

			for size in sizes {
				let sizeVector = SizeVector(size,
											constraint)
				let constraint = matchSize(view,
										   sizeVector: sizeVector)

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
	func fixSize(_ axes: [Size] = Size.all,
				 constraint: Constraint = .equal) -> SizeConstraints? {
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
	func height(_ viewConstraint: Constraint = .equal) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		let sizeVector = SizeVector(.height,
									viewConstraint)
		constraint = fixSize(sizeVector)

		return constraint
	}

	@discardableResult
	func width(_ viewConstraint: Constraint = .equal) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		let sizeVector = SizeVector(.width,
									viewConstraint)
		constraint = fixSize(sizeVector)

		return constraint
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func matchSize(_ view: ViewElement?,
				   sizeVector: ViewElement.SizeVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizeVector: sizeVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSize(_ view: ViewElement?,
				   sizeVectors: [ViewElement.SizeVector]) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizeVectors: sizeVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSize(_ view: ViewElement?,
				   sizes: [ViewElement.Size] = ViewElement.Size.all,
				   constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.matchSize(view,
													sizes: sizes)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func matchSizes(_ sizes: [ViewElement.Size] = ViewElement.Size.all,
					constraint: ViewElement.Constraint = .equal) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if sizes.count > 0,
			let firstElement = first {
			constraints = []

			for element in self {
				if element != first {
					let constraint = element?.matchSize(firstElement,
														sizes: sizes)
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
	func fixSize(_ sizes: [ViewElement.Size] = ViewElement.Size.all,
				 constraint: ViewElement.Constraint) -> [ViewElement.SizeConstraints?]? {
		var constraints: [ViewElement.SizeConstraints?]?

		if count > 0 {
			constraints = []

			for element in self {
				let fixConstraint = element?.fixSize(sizes,
													 constraint: constraint)
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
				let fixConstraint = element?.fixSize(ViewElement.Size.all,
													 constraint: constraint)
				constraints?.append(fixConstraint)
			}
		}

		return constraints
	}

	@discardableResult
	func height(_ viewConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.height(viewConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func width(_ viewConstraint: ViewElement.Constraint) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.width(viewConstraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
