//
//  SugarUI+LayoutConstraint.swift
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

private extension NSObject {
	@MainActor
	func constraintTo(_ object: NSObject,
					  _ viewConstraint: ViewElement.Constraint) -> LayoutConstraint {
		var constraint: LayoutConstraint!
		
		switch (self, object) {
		case (let from, let to) as (LayoutAnchor<AnyObject>, LayoutAnchor<AnyObject>):
			switch viewConstraint.relation {
			case .equal:
				constraint = from.constraint(equalTo: to,
											 constant: viewConstraint.constant)
			case .greater:
				constraint = from.constraint(greaterThanOrEqualTo: to,
											 constant: viewConstraint.constant)
			case .lesser:
				constraint = from.constraint(lessThanOrEqualTo: to,
											 constant: viewConstraint.constant)
			}
			constraint.priority = viewConstraint.priority
			constraint.isActive = viewConstraint.activate
		default:
			break
		}
		
		return constraint
	}
}

public extension HorizontalAnchor {
	@MainActor
	func constraint(to anchor: HorizontalAnchor,
					_ viewConstraint: ViewElement.Constraint) -> LayoutConstraint {
		constraintTo(anchor,
							viewConstraint)
	}
}

public extension VerticalAnchor {
	@MainActor
	func constraint(to anchor: VerticalAnchor,
					_ viewConstraint: ViewElement.Constraint) -> LayoutConstraint {
		constraintTo(anchor,
							viewConstraint)
	}
}

public extension LayoutDimension {
	@MainActor
	func constraint(to anchor: LayoutDimension? = nil,
					_ viewConstraint: ViewElement.Constraint) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let anchor = anchor {
			constraint = constraintTo(anchor,
									  viewConstraint)
		} else {
			switch viewConstraint.relation {
			case .equal:
				constraint = self.constraint(equalToConstant: viewConstraint.constant)
			case .greater:
				constraint = self.constraint(greaterThanOrEqualToConstant: viewConstraint.constant)
			case .lesser:
				constraint = self.constraint(lessThanOrEqualToConstant: viewConstraint.constant)
			}
			constraint?.priority = viewConstraint.priority
			constraint?.isActive = viewConstraint.activate
		}

		return constraint
	}
}
