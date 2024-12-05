//
//  UISwift+Chain.swift
//  UISwift
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
	enum ChainDirection {
		case vertical
		case horizontal
	}

	struct ChainVector {
		private(set) var direction: ChainDirection
		private(set) var constraint: Constraint

		init(_ direction: ChainDirection,
			 _ constraint: Constraint = .equal) {
			self.direction = direction
			self.constraint = constraint
		}

		@inlinable
		public static var vertical: ChainVector {
			vertical()
		}

		@inlinable
		public static var horizontal: ChainVector {
			horizontal()
		}

		public static func vertical(_ constraint: Constraint = .equal) -> ChainVector {
			.init(.vertical,
						 constraint)
		}

		public static func horizontal(_ constraint: Constraint = .equal) -> ChainVector {
			.init(.horizontal,
						 constraint)
		}
	}
}
