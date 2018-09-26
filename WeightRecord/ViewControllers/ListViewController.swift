//
//  ViewController.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/8/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var category: Category? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)

        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView])
        
        NSLayoutConstraint.activate(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return category?.subCategories.count ?? 0
        }
        
        return category?.exercises.count ?? 0
    }
    
    func numberOfSections(in: UITableView) -> Int {
        return 2
    }
    
    func exerciseTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = self.category else {
            return UITableViewCell(frame: .zero)
        }
        
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell")
        if(tableViewCell == nil) {
            tableViewCell = ExerciseTableViewCell(category.exercises[indexPath.row])
        }
        
        return tableViewCell!
    }

    func categoryTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = self.category else {
            return UITableViewCell(frame: .zero)
        }
        
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")
        if(tableViewCell == nil) {
            tableViewCell = CategoryTableViewCell(category.subCategories[indexPath.row])
        }
        
        return tableViewCell!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return categoryTableView(tableView, cellForRowAt:indexPath)
        } else {
            return exerciseTableView(tableView, cellForRowAt:indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let category = self.category else {
            return
        }
        
        if indexPath.section == 0 {
            let nextVC = ListViewController()
            nextVC.category = category.subCategories[indexPath.row]
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

