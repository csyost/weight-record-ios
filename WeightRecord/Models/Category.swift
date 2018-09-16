//
//  Category.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/9/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import Foundation

class Category: Decodable {
    public var title: String = ""
    public var subCategories: [Category] = []
    public var exercises: [Exercise] = []
}
