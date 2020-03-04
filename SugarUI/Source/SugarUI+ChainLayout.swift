//
//  SugarUI+ChainLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func chain(_ view: ViewElement?,
			   chainVector: ChainVector,
			   safeArea: Bool = false) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view = view {
			switch chainVector.direction {
			case .vertical:
				constraint = view.topAnchor(safeArea)
					.constraint(to: bottomAnchor(safeArea),
								chainVector.dimension)
			case .horizontal:
				constraint = view.leadAnchor(safeArea)
					.constraint(to: trailAnchor(safeArea),
								chainVector.dimension)
			}
		}

		return constraint
	}
}
