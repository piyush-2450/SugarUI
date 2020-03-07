//
//  SugarUI+AxisLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func center(_ view: ViewElement?,
				_ axisVector: AxisVector) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view = view {
			switch (axisVector.axis, axisVector.constraint) {
			case (.vertical, let axisConstraint):
				constraint = verticalCenterAnchor
					.constraint(to: view.verticalCenterAnchor,
								axisConstraint)
			case (.horizontal, let axisConstraint):
				constraint = horizontalCenterAnchor
					.constraint(to: view.horizontalCenterAnchor,
								axisConstraint)
			}
		}

		return constraint
	}

	@discardableResult
	func center(_ view: ViewElement?,
				_ axisVectors: [AxisVector]) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view = view,
			axisVectors.count > 0 {
			constraints = AxisConstraints()

			for axisVector in axisVectors {
				let constraint = center(view,
										axisVector)

				switch axisVector.axis {
				case .vertical:
					constraints?.vertical = constraint
				case .horizontal:
					constraints?.horizontal = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				_ axes: [Axis] = .all,
				_ constraint: Constraint = .equal) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view = view,
			axes.count > 0 {
			constraints = AxisConstraints()

			for axis in axes {
				let axisVector = AxisVector(axis,
											constraint)
				let constraint = center(view,
										axisVector)

				switch axisVector.axis {
				case .vertical:
					constraints?.vertical = constraint
				case .horizontal:
					constraints?.horizontal = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				_ axis: Axis,
				_ constraint: Constraint = .equal) -> LayoutConstraint? {
		var axisConstraint: LayoutConstraint?

		if let view = view {
			let axisVector = AxisVector(axis,
										constraint)
			axisConstraint = center(view,
									axisVector)
		}

		return axisConstraint
	}

	@discardableResult
	func center(_ views: [ViewElement?]?,
				_ axis: Axis,
				_ constraint: Constraint = .equal) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let views = views,
			views.count > 0 {
			constraints = []

			for view in views {
				let axisVector = AxisVector(axis,
											constraint)
				let axisConstraint = center(view,
											axisVector)
				constraints?.append(axisConstraint)
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func center(_ view: ViewElement?,
				_ axisVector: ViewElement.AxisVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axisVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				_ axisVectors: [ViewElement.AxisVector]) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view = view,
			axisVectors.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axisVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				_ axes: [ViewElement.Axis] = .all,
				_ constraint: ViewElement.Constraint = .equal) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view = view,
			axes.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axes,
												 constraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func centerViews(_ axis: ViewElement.Axis,
					 _ constraint: ViewElement.Constraint = .equal) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0,
			let firstElement = first {
			constraints = []

			for element in self {
				if element != first {
					let axisConstraint = element?.center(firstElement,
														 axis,
														 constraint)
					constraints?.append(axisConstraint)
				}
			}
		}

		return constraints
	}
}
