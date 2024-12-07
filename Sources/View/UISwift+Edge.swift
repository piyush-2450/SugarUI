//
//  UISwift+Edge.swift
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
	enum Edge {
		case lead
		case trail
		case top
		case bottom

		@MainActor public static let all: [Self] = Self.horizontalEdges + Self.verticalEdges
		@MainActor public static let verticalEdges: [Self] = [
			.top,
			.bottom
		]
		@MainActor public static let horizontalEdges: [Self] = [
			.lead,
			.trail
		]
	}

	struct EdgeVector {
		private(set) var edge: Edge
		private(set) var constraint: Constraint

		init(
			_ edge: Edge,
			_ constraint: Constraint = .equal
		) {
			self.edge = edge
			self.constraint = constraint
		}

		@inlinable
		public static var lead: Self {
			lead()
		}

		@inlinable
		public static var trail: Self {
			trail()
		}

		@inlinable
		public static var top: Self {
			top()
		}

		@inlinable
		public static var bottom: Self {
			bottom()
		}

		public static func lead(_ constraint: Constraint = .equal) -> Self {
			.init(
				.lead,
				constraint
			)
		}

		public static func trail(_ constraint: Constraint = .equal) -> Self {
			.init(
				.trail,
				constraint
			)
		}

		public static func top(_ constraint: Constraint = .equal) -> Self {
			.init(
				.top,
				constraint
			)
		}

		public static func bottom(_ constraint: Constraint = .equal) -> Self {
			.init(
				.bottom,
				constraint
			)
		}
	}

	struct EdgeConstraints {
		var lead: LayoutConstraint?
		var trail: LayoutConstraint?
		var top: LayoutConstraint?
		var bottom: LayoutConstraint?

		@MainActor
		var activate: Bool = false {
			didSet {
				lead?.isActive = activate
				trail?.isActive = activate
				top?.isActive = activate
				bottom?.isActive = activate
			}
		}

		mutating func set(
			_ edge: Edge,
			_ constraint: LayoutConstraint?
		) {
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
	@MainActor
	@inlinable
	static var all: [ViewElement.Edge] {
		ViewElement.Edge.all
	}
}
