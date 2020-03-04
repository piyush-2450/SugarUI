//
//  SugarUI.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
	import UIKit
	public typealias Unit = CGFloat
    public typealias ViewElement = UIView
    public typealias LayoutConstraint = NSLayoutConstraint
    public typealias LayoutPriority = UILayoutPriority
	public typealias HorizontalAnchor = NSLayoutXAxisAnchor
	public typealias VerticalAnchor = NSLayoutYAxisAnchor
	public typealias LayoutAnchor = NSLayoutAnchor
#elseif os(OSX)
	import Cocoa
	public typealias Unit = CGFloat
    public typealias ViewElement = NSView
    public typealias LayoutConstraint = NSLayoutConstraint
    public typealias LayoutPriority = NSLayoutConstraint.Priority
	public typealias HorizontalAnchor = NSLayoutXAxisAnchor
	public typealias VerticalAnchor = NSLayoutYAxisAnchor
	public typealias LayoutAnchor = NSLayoutAnchor
#else
    #error("Unsupported platform")
#endif

public extension ViewElement {
	static func instance() -> Self {
		func instance<T: ViewElement>() -> T {
			let instance = T(frame: .zero)
			instance.backgroundColor = .clear
			instance.translatesAutoresizingMaskIntoConstraints = false
			instance.clipsToBounds = true
			return instance
		}

		return instance()
	}
}
