//
//  ProductDataModels.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

//FIXME: temporary products data structure
struct ExpandableSection {
    var isExpanded: Bool
    let category: Category
}
struct Category {
    let id: Int
    let title: String
    let items: [Product]
}
struct Product {
    let title: String
    let name: String
    var isFinished: Bool = false
    var isExpired: Bool = false
    var isArchived: Bool = false
}

//data of PAO & RIC symbols
struct PAORICIcon {
    let imageName: String
    let label: String
}
