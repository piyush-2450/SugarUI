//
//  SugarUI+EdgeLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func align(_ subview: ViewElement?,
			   edgeVector: EdgeVector,
			   safeArea: Bool = false) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let subview = subview {
			switch (edgeVector.edge, edgeVector.constraint) {
			case (.lead, let axisConstraint):
				constraint = subview.leadAnchor(safeArea)
					.constraint(to: leadAnchor(safeArea),
								axisConstraint)
			case (.trail, let axisConstraint):
				constraint = trailAnchor(safeArea)
					.constraint(to: subview.trailAnchor(safeArea),
								axisConstraint)
			case (.top, let axisConstraint):
				constraint = subview.topAnchor(safeArea)
					.constraint(to: topAnchor(safeArea),
								axisConstraint)
			case (.bottom, let axisConstraint):
				constraint = bottomAnchor(safeArea)
					.constraint(to: subview.bottomAnchor(safeArea),
								axisConstraint)
			}
		}

		return constraint
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   edgeVectors: [EdgeVector],
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = EdgeConstraints()

			for edgeVector in edgeVectors {
				let constraint = align(subview,
									   edgeVector: edgeVector,
									   safeArea: safeArea)

				switch edgeVector.edge {
				case .lead:
					constraints?.lead = constraint
				case .trail:
					constraints?.trail = constraint
				case .top:
					constraints?.top = constraint
				case .bottom:
					constraints?.bottom = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   edges: [Edge] = Edge.all,
			   constraint: Constraint = .equal,
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edges.count > 0 {
			constraints = EdgeConstraints()

			for edge in edges {
				let edgeVector = EdgeVector(edge,
											constraint)
				let constraint = align(subview,
									   edgeVector: edgeVector,
									   safeArea: safeArea)

				switch edgeVector.edge {
				case .lead:
					constraints?.lead = constraint
				case .trail:
					constraints?.trail = constraint
				case .top:
					constraints?.top = constraint
				case .bottom:
					constraints?.bottom = constraint
				}
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func align(_ subview: ViewElement?,
			   edgeVector: ViewElement.EdgeVector,
			   safeArea: Bool = false) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let subview = subview,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVector: edgeVector,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   edgeVectors: [ViewElement.EdgeVector],
			   safeArea: Bool = false) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVectors: edgeVectors,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   edges: [ViewElement.Edge] = ViewElement.Edge.all,
			   constraint: ViewElement.Constraint = .equal,
			   safeArea: Bool = false) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edges.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edges: edges,
												constraint: constraint,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
