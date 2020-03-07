//
//  SugarUI+Edge.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	enum Edge {
		case lead
		case trail
		case top
		case bottom

		public static let all: [Edge] = Edge.horizontalEdges + Edge.verticalEdges
		public static let verticalEdges: [Edge] = [.top, .bottom]
		public static let horizontalEdges: [Edge] = [.lead, .trail]
	}

	struct EdgeVector {
		private(set) var edge: Edge
		private(set) var constraint: Constraint

		init(_ edge: Edge,
			 _ constraint: Constraint = .equal) {
			self.edge = edge
			self.constraint = constraint
		}

		public static var lead: EdgeVector {
			return lead()
		}

		public static var trail: EdgeVector {
			return trail()
		}

		public static var top: EdgeVector {
			return top()
		}

		public static var bottom: EdgeVector {
			return bottom()
		}

		public static func lead(_ constraint: Constraint = .equal) -> EdgeVector {
			return .init(.lead,
						 constraint)
		}

		public static func trail(_ constraint: Constraint = .equal) -> EdgeVector {
			return .init(.trail,
						 constraint)
		}

		public static func top(_ constraint: Constraint = .equal) -> EdgeVector {
			return .init(.top,
						 constraint)
		}

		public static func bottom(_ constraint: Constraint = .equal) -> EdgeVector {
			return .init(.bottom,
						 constraint)
		}
	}

	struct EdgeConstraints {
		var lead: LayoutConstraint?
		var trail: LayoutConstraint?
		var top: LayoutConstraint?
		var bottom: LayoutConstraint?

		var activate: Bool = false {
			didSet {
				lead?.isActive = activate
				trail?.isActive = activate
				top?.isActive = activate
				bottom?.isActive = activate
			}
		}

		mutating func set(_ edge: Edge,
						  _ constraint: LayoutConstraint?) {
			switch edge {
			case .lead:
				lead = constraint
			case .trail:
				trail = constraint
			case .top:
				top = constraint
			case .bottom:
				bottom = constraint
			}
		}
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement.Edge {
	static var all: [ViewElement.Edge] {
		return ViewElement.Edge.all
	}
}

