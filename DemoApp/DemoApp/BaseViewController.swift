//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import SugarUI

class BaseViewController: ViewController {
    var superview: ViewElement? {
        view
    }

    var subview1: ViewElement? = .instance()
    var subview2: ViewElement? = .instance()
    var subview3: ViewElement? = .instance()
    var subview4: ViewElement? = .instance()

    var subviews: [ViewElement?] {
        [subview1,
         subview2,
         subview3,
         subview4]
    }

    func doNotUse() {
        superview?.embed(subview1, >-20)

        embed(subviews, .vertical(>-20))
        superview?.center(subviews, .horizontal)

        ViewElement.chain([subview1, subview2, subview3], .vertical)

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
        view.colorBackground = .white

        let subviews = [subview1, subview2, subview3, subview4]

        subviews.backgroundColor([.green, .black, .red, .yellow])

        embed(subviews, .vertical(>-20))

        subviews.matchSizes()
        subviews.fixSizes(>-10)
    }
}
