//
//  SugarUI+ChainLayout.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	@discardableResult
	func chain(_ view: ViewElement?,
			   _ chainVector: ChainVector,
			   safeArea: Bool = false) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view = view {
			switch chainVector.direction {
			case .vertical:
				constraint = view.headAnchor(safeArea)
					.constraint(to: footAnchor(safeArea),
								chainVector.constraint)
			case .horizontal:
				constraint = view.leadAnchor(safeArea)
					.constraint(to: trailAnchor(safeArea),
								chainVector.constraint)
			}
		}

		return constraint
	}

	@discardableResult
	class func chain(_ views: [ViewElement?]?,
					 _ chainVector: ChainVector,
					 safeArea: Bool = false) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let views = views,
			views.count > 0 {
			constraints = []
			var previousView: ViewElement?

			for view in views {
				if let previousView = previousView {
					let constraint = previousView.chain(view,
														chainVector)
					constraints?.append(constraint)
				}

				previousView = view
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@discardableResult
	func chain(_ view: ViewElement?,
			   _ chainVector: ViewElement.ChainVector,
			   safeArea: Bool = false) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view = view,
			count > 0 {
			constraints = []

			for element in self {
				let constraint = element?.chain(view,
												chainVector,
												safeArea: safeArea)
				constraints?.append(constraint)
			}
		}

		return constraints
	}
}
