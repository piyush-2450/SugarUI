//
//  SugarUI+EdgeLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func align(_ view: ViewElement?,
			   edgeVector: EdgeVector,
			   safeArea: Bool = false) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view = view {
			switch (edgeVector.edge, edgeVector.dimension) {
			case (.lead, let dimension):
				constraint = leadAnchor(safeArea)
					.constraint(to: view.leadAnchor(safeArea),
								dimension)
			case (.trail, let dimension):
				constraint = trailAnchor(safeArea)
					.constraint(to: view.trailAnchor(safeArea),
								dimension)
			case (.top, let dimension):
				constraint = topAnchor(safeArea)
					.constraint(to: view.topAnchor(safeArea),
								dimension)
			case (.bottom, let dimension):
				constraint = bottomAnchor(safeArea)
					.constraint(to: view.bottomAnchor(safeArea),
								dimension)
			}
		}

		return constraint
	}

	@discardableResult
	func align(_ view: ViewElement?,
			   edgeVectors: [EdgeVector],
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let view = view,
			edgeVectors.count > 0 {
			constraints = EdgeConstraints()

			for edgeVector in edgeVectors {
				let constraint = align(view,
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
	func align(_ view: ViewElement?,
			   edges: [Edge] = Edge.allCases,
			   margin: Dimension = .equal,
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let view = view,
			edges.count > 0 {
			constraints = EdgeConstraints()

			for edge in edges {
				let edgeVector = EdgeVector(edge,
											margin)
				let constraint = align(view,
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
