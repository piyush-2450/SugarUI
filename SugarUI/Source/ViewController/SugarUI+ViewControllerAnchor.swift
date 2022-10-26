//
//  SugarUI+ViewControllerAnchor.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewController {
	var leadAnchor: HorizontalAnchor {
		leadAnchor()
	}

	var trailAnchor: HorizontalAnchor {
		trailAnchor()
	}

	var headAnchor: VerticalAnchor {
		headAnchor()
	}

	var footAnchor: VerticalAnchor {
		footAnchor()
	}

	var horizontalCenterAnchor: HorizontalAnchor {
		view.horizontalCenterAnchor
	}

	var verticalCenterAnchor: VerticalAnchor {
		view.verticalCenterAnchor
	}

	func leadAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		view.leadAnchor(safeArea)
	}

	func trailAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		view.trailAnchor(safeArea)
	}

	func headAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		view.headAnchor(safeArea)
	}

	func footAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		view.footAnchor(safeArea)
	}
}
