//
//  ExerciseTableViewCell.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/9/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import Foundation
import UIKit

class CategoryTableViewCell: UITableViewCell {
    var category: Category
    
    init(_ category: Category) {
        self.category = category
        super.init(style: .default, reuseIdentifier: nil)
        
        refresh()
    }
    
    required init?(coder decoder: NSCoder) {
        self.category = Category()
        super.init(coder: decoder)
    }
    
    private func refresh() {
        self.textLabel?.text = category.title
    }
}
