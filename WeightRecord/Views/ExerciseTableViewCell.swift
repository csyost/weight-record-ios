//
//  ExerciseTableViewCell.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/9/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import Foundation
import UIKit

class ExerciseTableViewCell: UITableViewCell {
    public var exercise: Exercise
    
    init(_ exercise: Exercise) {
        self.exercise = exercise
        super.init(style: .default, reuseIdentifier: nil)
        
        refresh()
    }
    
    required init?(coder decoder: NSCoder) {
        self.exercise = Exercise()
        super.init(coder: decoder)
    }
    
    private func refresh() {
        self.textLabel?.text = exercise.title
    }
}
