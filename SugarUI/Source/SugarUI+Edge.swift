//
//  SugarUI+Edge.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	enum Edge: CaseIterable {
		case lead
		case trail
		case top
		case bottom
	}

	struct EdgeVector {
		private(set) var edge: Edge
		private(set) var dimension: Dimension

		init(_ edge: Edge,
			 _ dimension: Dimension = .equal) {
			self.edge = edge
			self.dimension = dimension
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

		public static func lead(_ dimension: Dimension = .equal) -> EdgeVector {
			return .init(.lead,
						 dimension)
		}

		public static func trail(_ dimension: Dimension = .equal) -> EdgeVector {
			return .init(.trail,
						 dimension)
		}

		public static func top(_ dimension: Dimension = .equal) -> EdgeVector {
			return .init(.top,
						 dimension)
		}

		public static func bottom(_ dimension: Dimension = .equal) -> EdgeVector {
			return .init(.bottom,
						 dimension)
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
