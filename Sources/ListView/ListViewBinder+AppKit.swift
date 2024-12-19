//
//  ListViewBinder+AppKit.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Collections
import Foundation
import Observe

// swiftlint:disable one_declaration_per_file file_types_order
#if os(OSX)
import AppKit

public typealias ListDataSource = NSCollectionViewDataSource
public typealias ListDelegate = NSCollectionViewDelegate

@MainActor
public final class ListViewBinder<T,
								  List: ObservableList<T>,
								  View: ListView,
								  ItemView: ListItemView> {
	// MARK: + Internal scope

	final class DataSource: NSObject,
							ListDataSource {
		var observerRefs: [List.Index: ObservableValue<T?>.ObserverRef] = [:]

		weak var list: List?
		weak var listView: View?
		var onUpdate: UpdateHandler?

		func numberOfSections(in collectionView: ListView) -> Int {
			list?.rows ?? 0
		}

		func collectionView(
			_ collectionView: ListView,
			numberOfItemsInSection section: Int
		) -> Int {
			list?.columns ?? 0
		}

		func collectionView(
			_ collectionView: ListView,
			itemForRepresentedObjectAt indexPath: IndexPath
		) -> ListItemView {
			guard
				let list,
				let cell = collectionView.makeItem(
					withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "listView.cellReuseIdentifier"),
					for: indexPath
				) as? ItemView
			else {
				fatalError("Cell or listView configuration is invalid.")
			}

			let row: Int = indexPath.section
			let column: Int = indexPath.item
			let linearIndex: List.Index = list.linearIndex(
				row: row,
				column: column
			)

			if let observerRef = observerRefs[linearIndex] {
				list[row, column]?.removeObserver(observerRef)
			}

			let observerRef = list.observe(row, column) { value in
				DispatchQueue.main.async { [weak self] in
					self?.onUpdate?(
						(row, column),
						value,
						cell
					)
				}
			}

			observerRefs[linearIndex] = observerRef

			return cell
		}

		deinit {
			for (linearIndex, observerRef) in observerRefs {
				if let listIndex = list?.linearToListIndex(linearIndex) {
					list?[listIndex.row, listIndex.column]?
						.removeObserver(observerRef)
				}
			}
		}
	}

	final class Delegate: NSObject,
						  ListDelegate {
		weak var list: List?
		weak var listView: View?
		var onSelect: SelectHandler?

		func collectionView(
			_ collectionView: ListView,
			didSelectItemsAt indexPaths: Set<IndexPath>
		) {
			guard let list = list else {
				return
			}

			for indexPath in indexPaths {
				guard
					let item = list[indexPath.section, indexPath.item],
					let cell = collectionView.item(at: indexPath) as? ItemView
				else {
					continue
				}

				let row = indexPath.section
				let column = indexPath.item
				DispatchQueue.main.async { [weak self] in
					self?.onSelect?((row, column), item, cell)
				}
			}
		}

		deinit {
			//
		}
	}

	weak var list: List?
	weak var listView: View?

	let dataSource: DataSource = .init()
	let delegate: Delegate = .init()

	deinit {
		//
	}

	// MARK: + Public scope

	public typealias UpdateHandler = (List.ListIndex, T?, ItemView) -> Void
	public typealias SelectHandler = (List.ListIndex, T?, ItemView) -> Void

	public init(
		list: List,
		listView: View,
		onUpdate: @escaping UpdateHandler
	) {
		self.list = list
		self.listView = listView

		dataSource.list = list
		dataSource.listView = listView
		dataSource.onUpdate = onUpdate
		listView.register(
			ItemView.self,
			forItemWithIdentifier: NSUserInterfaceItemIdentifier(
				rawValue: "listView.cellReuseIdentifier"
			)
		)

		delegate.list = list
		delegate.listView = listView

		listView.dataSource = dataSource
		listView.delegate = delegate
	}

	public func onSelect(_ handler: SelectHandler?) {
		delegate.onSelect = handler
	}
}
#endif
// swiftlint:enable one_declaration_per_file file_types_order
