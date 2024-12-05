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
		safeAreaLayoutGuide.leadingAnchor
	}

	@inlinable
	var trailAnchor: HorizontalAnchor {
		safeAreaLayoutGuide.trailingAnchor
	}

	@inlinable
	var headAnchor: VerticalAnchor {
		safeAreaLayoutGuide.topAnchor
	}

	@inlinable
	var footAnchor: VerticalAnchor {
		safeAreaLayoutGuide.bottomAnchor
	}

	@inlinable
	var horizontalCenterAnchor: HorizontalAnchor {
		centerXAnchor
	}

	@inlinable
	var verticalCenterAnchor: VerticalAnchor {
		centerYAnchor
	}
}
