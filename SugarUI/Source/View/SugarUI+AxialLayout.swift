//
//  SugarUI+AxisLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 05-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func center(_ view: ViewElement?,
				axisVector: AxisVector) -> LayoutConstraint? {
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
				axisVectors: [AxisVector]) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view = view,
			axisVectors.count > 0 {
			constraints = AxisConstraints()

			for axisVector in axisVectors {
				let constraint = center(view,
										axisVector: axisVector)

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
				axes: [Axis] = Axis.all,
				constraint: Constraint = .equal) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view = view,
			axes.count > 0 {
			constraints = AxisConstraints()

			for axis in axes {
				let axisVector = AxisVector(axis,
											constraint)
				let constraint = center(view,
										axisVector: axisVector)

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
				axis: Axis,
				constraint: Constraint = .equal) -> LayoutConstraint? {
		var axisConstraint: LayoutConstraint?

		if let view = view {
			let axisVector = AxisVector(axis,
										constraint)
			axisConstraint = center(view,
									axisVector: axisVector)
		}

		return axisConstraint
	}

	@discardableResult
	func center(_ views: [ViewElement?]?,
				_ axis: Axis,
				constraint: Constraint = .equal) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let views = views,
			views.count > 0 {
			constraints = []

			for view in views {
				let axisVector = AxisVector(axis,
											constraint)
				let axisConstraint = center(view,
											axisVector: axisVector)
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
				axisVector: ViewElement.AxisVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axisVector: axisVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				axisVectors: [ViewElement.AxisVector]) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view = view,
			axisVectors.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axisVectors: axisVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func center(_ view: ViewElement?,
				axes: [ViewElement.Axis] = ViewElement.Axis.all,
				constraint: ViewElement.Constraint = .equal) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view = view,
			axes.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.center(view,
												 axes: axes,
												 constraint: constraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func centerViews(_ axis: ViewElement.Axis,
					 constraint: ViewElement.Constraint = .equal) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if count > 0,
			let firstElement = first {
			constraints = []

			for element in self {
				if element != first {
					let axisConstraint = element?.center(firstElement,
														 axis: axis,
														 constraint: constraint)
					constraints?.append(axisConstraint)
				}
			}
		}

		return constraints
	}
}
