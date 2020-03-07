//
//  SugarUI+ViewController.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 06-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewController {
	@discardableResult
	func embed(_ subviews: [ViewElement?]?,
			   _ chainVector: ViewElement.ChainVector,
			   _ padding: ViewElement.Constraint = .equal,
			   safeArea: Bool = true) -> [ViewElement.EdgeConstraints?]? {
		return view.embed(subviews,
						  chainVector,
						  padding,
						  safeArea: safeArea)
	}
}
