//
//  SugarUI+Constraint.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

prefix operator >-
prefix operator -<

public extension ViewElement {
	struct Constraint: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
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

		public static var equal: Constraint {
			return .equal()
		}

		public static var greater: Constraint {
			return .greater()
		}

		public static var lesser: Constraint {
			return .lesser()
		}

		public static func equal(_ constant: Unit = .zero,
								 _ priority: LayoutPriority = .required,
								 _ activate: Bool = true) -> Constraint {
			return .init(.equal,
						 constant,
						 priority,
						 activate)
		}

		public static func greater(_ constant: Unit = .zero,
								   _ priority: LayoutPriority = .required,
								   _ activate: Bool = true) -> Constraint {
			return .init(.greater,
						 constant,
						 priority,
						 activate)
		}

		public static func lesser(_ constant: Unit = .zero,
								  _ priority: LayoutPriority = .required,
								  _ activate: Bool = true) -> Constraint {
			return .init(.lesser,
						 constant,
						 priority,
						 activate)
		}

		public static prefix func -<(_ constraint: Constraint) -> Constraint {
			return .lesser(constraint.constant)
		}

		public static prefix func >-(_ constraint: Constraint) -> Constraint {
			return .greater(constraint.constant)
		}
	}
}
