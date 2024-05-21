//
//  SugarUI+EdgeLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public extension ViewElement {
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVector: EdgeVector,
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
				constraint = subview.headAnchor(safeArea)
					.constraint(to: headAnchor(safeArea),
								axisConstraint)
			case (.bottom, let axisConstraint):
				constraint = footAnchor(safeArea)
					.constraint(to: subview.footAnchor(safeArea),
								axisConstraint)
			}
		}

		return constraint
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVectors: [EdgeVector],
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = EdgeConstraints()

			for edgeVector in edgeVectors {
				let constraint = align(subview,
									   edgeVector,
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
			   _ edges: [Edge] = .all,
			   _ constraint: Constraint = .equal,
			   safeArea: Bool = false) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edges.count > 0 {
			constraints = EdgeConstraints()

			for edge in edges {
				let edgeVector = EdgeVector(edge,
											constraint)
				let constraint = align(subview,
									   edgeVector,
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
	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVector: ViewElement.EdgeVector,
			   safeArea: Bool = false) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let subview = subview,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVector,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVectors: [ViewElement.EdgeVector],
			   safeArea: Bool = false) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVectors,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edges: [ViewElement.Edge] = .all,
			   _ constraint: ViewElement.Constraint = .equal,
			   safeArea: Bool = false) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edges.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edges,
												constraint,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
