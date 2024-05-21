//
//  SugarUI+Subviews.swift
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
	// MARK: Private scope

	private typealias EdgeConstraint = (edge: Edge, constraint: LayoutConstraint?)

	private func alignBeginingEdge(_ view: ViewElement?,
								   _ chainVector: ChainVector,
								   _ padding: ViewElement.Constraint,
								   safeArea: Bool) -> EdgeConstraint {
		var edge = Edge.top

		switch chainVector.direction {
		case .vertical:
			edge = .top
		case .horizontal:
			edge = .lead
		}

		return (edge, align(view,
							.init(edge, padding),
							safeArea: safeArea))
	}

	private func alignEndingEdge(_ view: ViewElement?,
								 _ chainVector: ChainVector,
								 _ padding: ViewElement.Constraint,
								 safeArea: Bool) -> EdgeConstraint {
		var edge = Edge.bottom

		switch chainVector.direction {
		case .vertical:
			edge = .bottom
		case .horizontal:
			edge = .trail
		}

		return (edge, align(view,
							.init(edge, padding),
							safeArea: safeArea))
	}

	private func alignOtherEdges(_ view: ViewElement?,
								 _ chainVector: ChainVector,
								 _ padding: ViewElement.Constraint,
								 safeArea: Bool) -> EdgeConstraints? {
		var edges: [Edge] = [.lead, .trail]

		switch chainVector.direction {
		case .vertical:
			edges = [.lead, .trail]
		case .horizontal:
			edges = [.top, .bottom]
		}

		return align(view,
					 edges,
					 padding)
	}

	// MARK: Internal scope

	func add(_ subview: ViewElement?) {
		if let subview = subview {
			addSubview(subview)
		}
	}

	func add(_ subviews: [ViewElement?]?) {
		if let subviews = subviews {
			for subview in subviews {
				add(subview)
			}
		}
	}

	@discardableResult
	func embed(_ subview: ViewElement?,
			   _ constraint: ViewElement.Constraint = .equal,
			   safeArea: Bool = false) -> EdgeConstraints? {
		add(subview)
		return align(subview,
					 .all,
					 constraint,
					 safeArea: safeArea)
	}

	@discardableResult
	func embed(_ subview: ViewElement?,
			   _ edgeVectors: [EdgeVector],
			   safeArea: Bool = false) -> EdgeConstraints? {
		add(subview)
		return align(subview,
					 edgeVectors,
					 safeArea: safeArea)
	}

	@discardableResult
	func embed(_ subviews: [ViewElement?]?,
			   _ chainVector: ChainVector,
			   _ padding: ViewElement.Constraint = .equal,
			   safeArea: Bool = false) -> [EdgeConstraints?]? {
		var constraints: [EdgeConstraints?]?

		if let subviews = subviews,
			subviews.count > 0 {
			add(subviews)

			constraints = []
			var previousView: ViewElement?
			var previousEdgeConstraints: EdgeConstraints?

			for view in subviews {
				var edgeConstraints = alignOtherEdges(view,
													  chainVector,
													  padding,
													  safeArea: safeArea)

				if view == subviews.first {
					let result = alignBeginingEdge(view,
												   chainVector,
												   padding,
												   safeArea: safeArea)
					edgeConstraints?.set(result.edge, result.constraint)
				}

				if view == subviews.last {
					let result = alignEndingEdge(view,
												 chainVector,
												 padding,
												 safeArea: safeArea)
					edgeConstraints?.set(result.edge, result.constraint)
				}

				if let constraint = previousView?
					.chain(view,
						   chainVector,
						   safeArea: safeArea) {
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
