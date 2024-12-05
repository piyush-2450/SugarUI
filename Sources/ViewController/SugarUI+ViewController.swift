//
//  SugarUI+ViewController.swift
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

extension ViewController: @preconcurrency SugarUIView {
	@inlinable
	public var bgColor: ViewColor? {
		get {
			view.bgColor
		}
		set {
			view.bgColor = newValue
		}
	}

	@inlinable
	public var leadAnchor: HorizontalAnchor {
		view.leadAnchor
	}

	@inlinable
	public var trailAnchor: HorizontalAnchor {
		view.trailAnchor
	}

	@inlinable
	public var headAnchor: VerticalAnchor {
		view.headAnchor
	}

	@inlinable
	public var footAnchor: VerticalAnchor {
		view.footAnchor
	}

	@inlinable
	public var horizontalCenterAnchor: HorizontalAnchor {
		view.horizontalCenterAnchor
	}

	@inlinable
	public var verticalCenterAnchor: VerticalAnchor {
		view.verticalCenterAnchor
	}

	@inlinable
	public func add(_ subview: ViewElement?) {
		view.add(subview)
	}

	@inlinable
	public func add(_ subviews: [ViewElement?]?) {
		view.add(subviews)
	}

	@inlinable
	public func embed(
		_ subview: ViewElement?,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.EdgeConstraints? {
		view.embed(
			subview,
			constraint
		)
	}

	@inlinable
	public func embed(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints? {
		view.embed(
			subview,
			edgeVectors
		)
	}

	@inlinable
	public func embed(
		_ subviews: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector,
		_ padding: ViewElement.Constraint = .equal
	) -> [ViewElement.EdgeConstraints?]? {
		view.embed(
			subviews,
			chainVector,
			padding
		)
	}

	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axisVector: ViewElement.AxisVector
	) -> LayoutConstraint? {
		self.view.center(
			view,
			axisVector
		)
	}

	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axisVectors: [ViewElement.AxisVector]
	) -> ViewElement.AxisConstraints? {
		self.view.center(
			view,
			axisVectors
		)
	}

	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axes: [ViewElement.Axis],
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.AxisConstraints? {
		self.view.center(
			view,
			axes,
			constraint
		)
	}

	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint = .equal
	) -> LayoutConstraint? {
		self.view.center(
			view,
			axis,
			constraint
		)
	}

	@inlinable
	public func center(
		_ views: [ViewElement?]?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint = .equal
	) -> [LayoutConstraint?]? {
		view.center(
			views,
			axis,
			constraint
		)
	}

	@inlinable
	public func chain(
		_ view: ViewElement?,
		_ chainVector: ViewElement.ChainVector
	) -> LayoutConstraint? {
		self.view.chain(
			view,
			chainVector
		)
	}

	@inlinable
	public static func chain(
		_ views: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector
	) -> [LayoutConstraint?]? {
		ViewElement.chain(
			views,
			chainVector
		)
	}

	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edgeVector: ViewElement.EdgeVector
	) -> LayoutConstraint? {
		view.align(
			subview,
			edgeVector
		)
	}

	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints? {
		view.align(
			subview,
			edgeVectors
		)
	}

	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edges: [ViewElement.Edge] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.EdgeConstraints? {
		view.align(
			subview,
			edges,
			constraint
		)
	}

	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizeVector: ViewElement.SizeVector
	) -> LayoutConstraint? {
		self.view.matchSize(
			view,
			sizeVector
		)
	}

	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizeVectors: [ViewElement.SizeVector]
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			sizeVectors
		)
	}

	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			sizes,
			constraint
		)
	}

	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			constraint
		)
	}

	@inlinable
	public func fixSize(_ sizeVector: ViewElement.SizeVector) -> LayoutConstraint? {
		view.fixSize(sizeVector)
	}

	@inlinable
	public func fixSize(_ sizeVectors: [ViewElement.SizeVector]) -> ViewElement.SizeConstraints? {
		view.fixSize(sizeVectors)
	}

	@inlinable
	public func fixSize(
		_ axes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		view.fixSize(
			axes,
			constraint
		)
	}

	@inlinable
	public func height(_ sizeConstraint: ViewElement.Constraint = .equal) -> LayoutConstraint? {
		view.height(sizeConstraint)
	}

	@inlinable
	public func height(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]? {
		view.height(sizeConstraints)
	}

	@inlinable
	public func width(_ sizeConstraint: ViewElement.Constraint = .equal) -> LayoutConstraint? {
		view.width(sizeConstraint)
	}

	@inlinable
	public func width(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]? {
		view.width(sizeConstraints)
	}
}
