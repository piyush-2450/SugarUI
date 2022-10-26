//
//  SugarUI+Anchor.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
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
		centerXAnchor
	}

	var verticalCenterAnchor: VerticalAnchor {
		centerYAnchor
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
	
	func headAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = topAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.topAnchor
		}
		
		return anchor
	}

	func footAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = bottomAnchor

		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.bottomAnchor
		}

		return anchor
	}
}
