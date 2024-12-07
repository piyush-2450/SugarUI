//
//  UISwift+Subviews.swift
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

// swiftlint:disable discouraged_optional_collection function_body_length
public extension ViewElement {
	// MARK: Private scope

	private typealias EdgeConstraint = (
		edge: Edge,
		constraint: LayoutConstraint?
	)

	private func alignBeginningEdge(
		_ view: ViewElement?,
		_ chainVector: ChainVector,
		_ padding: ViewElement.Constraint
	) -> EdgeConstraint {
		var edge: Edge = Edge.top

		switch chainVector.direction {
		case .vertical:
			edge = .top

		case .horizontal:
			edge = .lead
		}

		return (
			edge,
			align(
				view,
				.init(edge, padding)
			)
		)
	}

	private func alignEndingEdge(
		_ view: ViewElement?,
		_ chainVector: ChainVector,
		_ padding: ViewElement.Constraint
	) -> EdgeConstraint {
		var edge: Edge = Edge.bottom

		switch chainVector.direction {
		case .vertical:
			edge = .bottom

		case .horizontal:
			edge = .trail
		}

		return (
			edge,
			align(
				view,
				.init(edge, padding)
			)
		)
	}

	private func alignOtherEdges(
		_ view: ViewElement?,
		_ chainVector: ChainVector,
		_ padding: ViewElement.Constraint
	) -> EdgeConstraints? {
		var edges: [Edge] = [.lead, .trail]

		switch chainVector.direction {
		case .vertical:
			edges = [.lead, .trail]

		case .horizontal:
			edges = [.top, .bottom]
		}

		return align(
			view,
			edges,
			padding
		)
	}

	// MARK: Public scope

	@inlinable
	func add(_ subview: ViewElement?) {
		if let subview {
			addSubview(subview)
		}
	}

	@inlinable
	func add(_ subviews: [ViewElement?]?) {
		if let subviews {
			for subview in subviews {
				add(subview)
			}
		}
	}

	@inlinable
	@discardableResult
	func embed(
		_ subview: ViewElement?,
		_ constraint: ViewElement.Constraint = .equal
	) -> EdgeConstraints? {
		add(subview)
		return align(
			subview,
			.all,
			constraint
		)
	}

	@inlinable
	@discardableResult
	func embed(
		_ subview: ViewElement?,
		_ edgeVectors: [EdgeVector]
	) -> EdgeConstraints? {
		add(subview)
		return align(
			subview,
			edgeVectors
		)
	}

	@discardableResult
	func embed(
		_ subviews: [ViewElement?]?,
		_ chainVector: ChainVector,
		_ padding: ViewElement.Constraint = .equal
	) -> [EdgeConstraints?]? {
		var constraints: [EdgeConstraints?]?

		if let subviews,
		   subviews.isEmpty == false {
			add(subviews)

			constraints = []
			var previousView: ViewElement?
			var previousEdgeConstraints: EdgeConstraints?

			for view in subviews {
				var edgeConstraints: ViewElement.EdgeConstraints? = alignOtherEdges(
					view,
					chainVector,
					padding
				)

				if view == subviews.first {
					let result: EdgeConstraint = alignBeginningEdge(
						view,
						chainVector,
						padding
					)
					edgeConstraints?.set(
						result.edge,
						result.constraint
					)
				}

				if view == subviews.last {
					let result: EdgeConstraint = alignEndingEdge(
						view,
						chainVector,
						padding
					)
					edgeConstraints?.set(
						result.edge,
						result.constraint
					)
				}

				if let constraint = previousView?
					.chain(
						view,
						chainVector
					) {
					switch chainVector.direction {
					case .vertical:
						edgeConstraints?.top = constraint
						previousEdgeConstraints?.bottom = constraint

					case .horizontal:
						edgeConstraints?.lead = constraint
						previousEdgeConstraints?.trail = constraint
					}
				}

				constraints?.append(edgeConstraints)

				previousView = view
				previousEdgeConstraints = edgeConstraints
			}
		}

		return constraints
	}
}
// swiftlint:enable discouraged_optional_collection function_body_length
