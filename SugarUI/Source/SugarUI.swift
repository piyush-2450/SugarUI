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
    public typealias ViewController = UIViewController
    public typealias ViewElement = UIView
	public typealias ViewColor = UIColor
    public typealias LayoutConstraint = NSLayoutConstraint
    public typealias LayoutPriority = UILayoutPriority
	public typealias HorizontalAnchor = NSLayoutXAxisAnchor
	public typealias VerticalAnchor = NSLayoutYAxisAnchor
	public typealias LayoutAnchor = NSLayoutAnchor
	public typealias LayoutDimension = NSLayoutDimension
#elseif os(OSX)
	import AppKit
	public typealias Unit = CGFloat
    public typealias ViewController = NSViewController
    public typealias ViewElement = NSView
	public typealias ViewColor = UIColor
    public typealias LayoutConstraint = NSLayoutConstraint
    public typealias LayoutPriority = NSLayoutConstraint.Priority
	public typealias HorizontalAnchor = NSLayoutXAxisAnchor
	public typealias VerticalAnchor = NSLayoutYAxisAnchor
	public typealias LayoutAnchor = NSLayoutAnchor
	public typealias LayoutDimension = NSLayoutDimension
#else
    #error("Unsupported platform")
#endif
