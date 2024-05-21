//
//  SugarUI+Axis.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public extension ViewElement {
	enum Axis {
		case vertical
		case horizontal
		
		public static let all: [Axis] = [.vertical, .horizontal]
	}
	
	struct AxisVector {
		private(set) var axis: Axis
		private(set) var constraint: Constraint
		
		init(_ axis: Axis,
			 _ constraint: Constraint = .equal) {
			self.axis = axis
			self.constraint = constraint
		}
		
		public static var vertical: AxisVector {
			vertical()
		}
		
		public static var horizontal: AxisVector {
			horizontal()
		}
		
		public static func vertical(_ constraint: Constraint = .equal) -> AxisVector {
			.init(.vertical,
						 constraint)
		}
		
		public static func horizontal(_ constraint: Constraint = .equal) -> AxisVector {
			.init(.horizontal,
						 constraint)
		}
	}
	
	struct AxisConstraints {
		var vertical: LayoutConstraint?
		var horizontal: LayoutConstraint?
		
		var activate: Bool = false {
			didSet {
				vertical?.isActive = activate
				horizontal?.isActive = activate
			}
		}
		
		mutating func set(_ axis: Axis,
						  _ constraint: LayoutConstraint?) {
			switch axis {
			case .vertical:
				vertical = constraint
			case .horizontal:
				horizontal = constraint
			}
		}
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement.Axis {
	static var all: [ViewElement.Axis] {
		ViewElement.Axis.all
	}
}
