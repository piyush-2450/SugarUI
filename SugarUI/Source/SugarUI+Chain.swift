//
//  SugarUI+Chain.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	enum ChainDirection {
		case vertical
		case horizontal
	}

	struct ChainVector {
		private(set) var direction: ChainDirection
		private(set) var dimension: Dimension

		init(_ direction: ChainDirection,
			 _ dimension: Dimension = .equal) {
			self.direction = direction
			self.dimension = dimension
		}

		public static var vertical: ChainVector {
			return vertical()
		}

		public static var horizontal: ChainVector {
			return horizontal()
		}

		public static func vertical(_ dimension: Dimension = .equal) -> ChainVector {
			return .init(.vertical,
						 dimension)
		}

		public static func horizontal(_ dimension: Dimension = .equal) -> ChainVector {
			return .init(.horizontal,
						 dimension)
		}
	}
}
