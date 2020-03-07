//
//  ViewController.swift
//  DemoApp
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

import UIKit
import SugarUI

class ViewController: UIViewController {
	var superview: UIView? {
		return view
	}

	var subview1: UIView? = .instance()
	var subview2: UIView? = .instance()
	var subview3: UIView? = .instance()
	var subview4: UIView? = .instance()

	var subviews: [UIView?] {
		return [subview1,
				subview2,
				subview3,
				subview4]
	}

	func doNotUse() {
		superview?.embed(subview1, >-20)

		embed(subviews, .vertical(>-20))
		superview?.center(subviews, .horizontal)

		UIView.chain([subview1, subview2, subview3], .vertical)

		subview1?.chain(subview2, .vertical)
		subview2?.chain(subview3, .vertical)

		superview?.center(subview1)
		superview?.center(subviews, .vertical)

		subview1?.center(subview2)

		subview1?.height(-<20)
		subview1?.height([-<20, >-10])

		subview1?.width(-<20)
		subview1?.width([-<20, >-10])

		subview2?.matchSize(subview1)
		subview2?.matchSize(subview1, 20)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		let subviews = [subview1, subview2, subview3, subview4]

		subviews.backgroundColor([.green, .black, .red, .yellow])

		embed(subviews, .vertical(>-20))

		subviews.matchSizes()
		subviews.fixSizes(>-10)
	}
}
