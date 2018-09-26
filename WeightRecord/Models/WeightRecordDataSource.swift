//
//  WeightRecordDataSource.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/16/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import Foundation

class WeightRecordDataSource {
    static let dataSource: Category = {
        if let path = Bundle.main.path(forResource: "baseData", ofType: "json")
        {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonResult: Category = try JSONDecoder().decode(Category.self, from: jsonData)
                return jsonResult
            } catch {
                print(error)
            }
        }
        return Category()
    }()
}
