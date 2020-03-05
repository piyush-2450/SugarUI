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
								chainVector.constraint)
			case .horizontal:
				constraint = view.leadAnchor(safeArea)
					.constraint(to: trailAnchor(safeArea),
								chainVector.constraint)
			}
		}

		return constraint
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func chain(_ view: ViewElement?,
			   chainVector: ViewElement.ChainVector,
			   safeArea: Bool = false) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.chain(view,
												chainVector: chainVector,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
