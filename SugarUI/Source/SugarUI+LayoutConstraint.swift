//
//  SugarUI+LayoutConstraint.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

private extension NSObject {
	func constraintTo(_ object: NSObject,
					  _ dimension: ViewElement.Dimension) -> LayoutConstraint {
		var constraint: LayoutConstraint!
		
		switch (self, object) {
		case (let from, let to) as (LayoutAnchor<AnyObject>, LayoutAnchor<AnyObject>):
			switch dimension.relation {
			case .equal:
				constraint = from.constraint(equalTo: to,
											 constant: dimension.constant)
			case .greater:
				constraint = from.constraint(greaterThanOrEqualTo: to,
											 constant: dimension.constant)
			case .lesser:
				constraint = from.constraint(lessThanOrEqualTo: to,
											 constant: dimension.constant)
			}
			constraint.priority = dimension.priority
			constraint.isActive = dimension.activate
		default:
			break
		}
		
		return constraint
	}
}

public extension HorizontalAnchor {
	func constraint(to anchor: HorizontalAnchor,
					_ dimension: ViewElement.Dimension) -> LayoutConstraint {
		return constraintTo(anchor,
							dimension)
	}
}

public extension VerticalAnchor {
	func constraint(to anchor: VerticalAnchor,
					_ dimension: ViewElement.Dimension) -> LayoutConstraint {
		return constraintTo(anchor,
							dimension)
	}
}
