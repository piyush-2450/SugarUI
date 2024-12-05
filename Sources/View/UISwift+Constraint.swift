//
//  UISwift+Constraint.swift
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

prefix operator >-
prefix operator -<

public extension ViewElement {
	struct Constraint: ExpressibleByIntegerLiteral,
					   ExpressibleByFloatLiteral {
		public enum Relation {
			case equal
			case greater
			case lesser
		}

		private(set) var relation: Relation
		private(set) var constant: Unit
		private(set) var priority: LayoutPriority
		private(set) var activate: Bool

		private init(_ relation: Relation,
					 _ constant: Unit,
					 _ priority: LayoutPriority = .required,
					 _ activate: Bool = true) {
			self.relation = relation
			self.constant = constant
			self.priority = priority
			self.activate = activate
		}

		public init(integerLiteral value: Int) {
			self.init(floatLiteral: Double(value))
		}

		public init(floatLiteral value: Double) {
			self.init(.equal,
					  Unit(value))
		}

		@inlinable
		public static var equal: Constraint {
			.equal()
		}

		@inlinable
		public static var greater: Constraint {
			.greater()
		}

		@inlinable
		public static var lesser: Constraint {
			.lesser()
		}

		public static func equal(_ constant: Unit = .zero,
								 _ priority: LayoutPriority = .required,
								 _ activate: Bool = true) -> Constraint {
			.init(.equal,
				  constant,
				  priority,
				  activate)
		}

		public static func greater(_ constant: Unit = .zero,
								   _ priority: LayoutPriority = .required,
								   _ activate: Bool = true) -> Constraint {
			.init(.greater,
				  constant,
				  priority,
				  activate)
		}

		public static func lesser(_ constant: Unit = .zero,
								  _ priority: LayoutPriority = .required,
								  _ activate: Bool = true) -> Constraint {
			.init(.lesser,
				  constant,
				  priority,
				  activate)
		}

		public static prefix func -<(_ constraint: Constraint) -> Constraint {
			.lesser(constraint.constant)
		}

		public static prefix func >-(_ constraint: Constraint) -> Constraint {
			.greater(constraint.constant)
		}
	}
}
