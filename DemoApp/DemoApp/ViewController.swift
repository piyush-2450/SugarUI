//
//  ViewController.swift
//  DemoApp
//
//  Created by Piyush Banerjee on 05-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

import UIKit
import SugarUI

class ViewController: UIViewController {
	var view1: UIView? = .instance()
	var view2: UIView? = .instance()
	var view3: UIView? = .instance()
	var view4: UIView? = .instance()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		let views = [view1, view2, view3, view4]

		views.backgroundColor([.green, .black, .red, .yellow])

		embed(views, .vertical(>-20))
		view.center(views, .horizontal)

		views.matchSizes()
		views.fixSizes(>-10)
	}
}
