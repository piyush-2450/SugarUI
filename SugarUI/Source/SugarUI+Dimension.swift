//
//  SugarUI+Dimension.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	struct Dimension {
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

		public static var equal: Dimension {
			return .equal()
		}

		public static var greater: Dimension {
			return .greater()
		}

		public static var lesser: Dimension {
			return .lesser()
		}

		public static func equal(_ constant: Unit = .zero,
								 _ priority: LayoutPriority = .required,
								 _ activate: Bool = true) -> Dimension {
			return .init(.equal,
						 constant,
						 priority,
						 activate)
		}

		public static func greater(_ constant: Unit = .zero,
								   _ priority: LayoutPriority = .required,
								   _ activate: Bool = true) -> Dimension {
			return .init(.greater,
						 constant,
						 priority,
						 activate)
		}

		public static func lesser(_ constant: Unit = .zero,
								  _ priority: LayoutPriority = .required,
								  _ activate: Bool = true) -> Dimension {
			return .init(.lesser,
						 constant,
						 priority,
						 activate)
		}
	}
}
