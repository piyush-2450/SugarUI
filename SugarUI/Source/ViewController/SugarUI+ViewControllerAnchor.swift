//
//  SugarUI+ViewControllerAnchor.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewController {
	var leadAnchor: HorizontalAnchor {
		return leadAnchor()
	}

	var trailAnchor: HorizontalAnchor {
		return trailAnchor()
	}

	var topAnchor: VerticalAnchor {
		return topAnchor()
	}

	var bottomAnchor: VerticalAnchor {
		return bottomAnchor()
	}

	var horizontalCenterAnchor: HorizontalAnchor {
		return view.horizontalCenterAnchor
	}

	var verticalCenterAnchor: VerticalAnchor {
		return view.verticalCenterAnchor
	}

	func leadAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		return view.leadAnchor(safeArea)
	}

	func trailAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		return view.trailAnchor(safeArea)
	}

	func topAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		return view.topAnchor(safeArea)
	}

	func bottomAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		return view.bottomAnchor(safeArea)
	}
}
