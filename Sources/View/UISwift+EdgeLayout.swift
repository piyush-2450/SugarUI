//
//  UISwift+EdgeLayout.swift
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

public extension ViewElement {
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVector: EdgeVector) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let subview = subview {
			switch (edgeVector.edge, edgeVector.constraint) {
			case (.lead, let axisConstraint):
				constraint = subview.leadAnchor
					.constraint(to: leadAnchor,
								axisConstraint)
			case (.trail, let axisConstraint):
				constraint = trailAnchor
					.constraint(to: subview.trailAnchor,
								axisConstraint)
			case (.top, let axisConstraint):
				constraint = subview.headAnchor
					.constraint(to: headAnchor,
								axisConstraint)
			case (.bottom, let axisConstraint):
				constraint = footAnchor
					.constraint(to: subview.footAnchor,
								axisConstraint)
			}
		}

		return constraint
	}

	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVectors: [EdgeVector]) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = EdgeConstraints()

			for edgeVector in edgeVectors {
				let constraint = align(subview,
									   edgeVector)

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
			   _ constraint: Constraint = .equal) -> EdgeConstraints? {
		var constraints: EdgeConstraints?

		if let subview = subview,
			edges.count > 0 {
			constraints = EdgeConstraints()

			for edge in edges {
				let edgeVector = EdgeVector(edge,
											constraint)
				let constraint = align(subview,
									   edgeVector)

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
	@MainActor
	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVector: ViewElement.EdgeVector) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let subview = subview,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVector)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edgeVectors: [ViewElement.EdgeVector]) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edgeVectors.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edgeVectors)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func align(_ subview: ViewElement?,
			   _ edges: [ViewElement.Edge] = .all,
			   _ constraint: ViewElement.Constraint = .equal) -> [ViewElement.EdgeConstraints?]? {
		var constraints: [ViewElement.EdgeConstraints?]?

		if let subview = subview,
			edges.count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.align(subview,
												edges,
												constraint)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
