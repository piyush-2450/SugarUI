//
//  SugarUI+ViewControllerAnchor.swift
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

public extension ViewController {
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
		view.horizontalCenterAnchor
	}

	@inlinable
	var verticalCenterAnchor: VerticalAnchor {
		view.verticalCenterAnchor
	}

	@inlinable
	func leadAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		view.leadAnchor(safeArea)
	}

	@inlinable
	func trailAnchor(_ safeArea: Bool = false) -> HorizontalAnchor {
		view.trailAnchor(safeArea)
	}

	@inlinable
	func headAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		view.headAnchor(safeArea)
	}

	@inlinable
	func footAnchor(_ safeArea: Bool = false) -> VerticalAnchor {
		view.footAnchor(safeArea)
	}
}
