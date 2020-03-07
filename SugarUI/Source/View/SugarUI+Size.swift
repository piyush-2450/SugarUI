//
//  SugarUI+Size.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	enum Size {
		case height
		case width

		public static let all: [Size] = [.height, .width]
	}

	struct SizeVector {
		private(set) var size: Size
		private(set) var constraint: Constraint

		init(_ axis: Size,
			 _ constraint: Constraint = .equal) {
			self.size = axis
			self.constraint = constraint
		}

		public static var height: SizeVector {
			return height()
		}

		public static var width: SizeVector {
			return width()
		}

		public static func height(_ constraint: Constraint = .equal) -> SizeVector {
			return .init(.height,
						 constraint)
		}

		public static func width(_ constraint: Constraint = .equal) -> SizeVector {
			return .init(.width,
						 constraint)
		}
	}

	struct SizeConstraints {
		var height: LayoutConstraint?
		var width: LayoutConstraint?

		var activate: Bool = false {
			didSet {
				height?.isActive = activate
				width?.isActive = activate
			}
		}

		mutating func set(_ axis: Size,
						  _ constraint: LayoutConstraint?) {
			switch axis {
			case .height:
				height = constraint
			case .width:
				width = constraint
			}
		}
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement.Size {
	static var all: [ViewElement.Size] {
		return ViewElement.Size.all
	}
}
