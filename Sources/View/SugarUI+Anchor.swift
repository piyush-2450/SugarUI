//
//  SugarUI+Anchor.swift
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

public extension ViewElement {
	@inlinable
	var leadAnchor: HorizontalAnchor {
		leadAnchor()
	}

	@inlinable
	var trailAnchor: HorizontalAnchor {
		trailAnchor()
	}

	@inlinable
	var headAnchor: VerticalAnchor {
		headAnchor()
	}

	@inlinable
	var footAnchor: VerticalAnchor {
		footAnchor()
	}

	@inlinable
	var horizontalCenterAnchor: HorizontalAnchor {
		centerXAnchor
	}

	@inlinable
	var verticalCenterAnchor: VerticalAnchor {
		centerYAnchor
	}

	@inlinable
	func leadAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		var anchor = leadingAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.leadingAnchor
		}
		
		return anchor
	}
	
	@inlinable
	func trailAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		var anchor = trailingAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.trailingAnchor
		}
		
		return anchor
	}
	
	@inlinable
	func headAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = topAnchor
		
		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.topAnchor
		}
		
		return anchor
	}

	@inlinable
	func footAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		var anchor = bottomAnchor

		if safeArea == true,
			#available(iOS 11.0, *) {
			anchor = safeAreaLayoutGuide.bottomAnchor
		}

		return anchor
	}
}
