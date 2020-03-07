//
//  SugarUI+Anchor.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
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
		return centerXAnchor
	}

	var verticalCenterAnchor: VerticalAnchor {
		return centerYAnchor
	}

	func leadAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		var anchor = leadingAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.leadingAnchor
		}
		
		return anchor
	}
	
	func trailAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		var anchor = trailingAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.trailingAnchor
		}
		
		return anchor
	}
	
	func topAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = topAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.topAnchor
		}
		
		return anchor
	}

	func bottomAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = bottomAnchor

		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.bottomAnchor
		}

		return anchor
	}
}
