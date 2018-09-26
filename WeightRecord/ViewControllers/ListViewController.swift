//
//  ViewController.swift
//  WeightRecord
//
//  Created by Casey Yost on 9/8/18.
//  Copyright © 2018 Casey Yost. All rights reserved.
//

import UIKit

enum Section: Int{
    case Categories, Exercises, Add
}

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
        switch Section(rawValue: section)! {
        case .Categories:
            return category?.subCategories.count ?? 0
        case .Exercises:
            return category?.exercises.count ?? 0
        case .Add:
            return 1
        }
    }
    
    func numberOfSections(in: UITableView) -> Int {
        return 3
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
        switch Section(rawValue: indexPath.section)! {
        case .Categories:
                return categoryTableView(tableView, cellForRowAt:indexPath)
        case .Exercises:
                return exerciseTableView(tableView, cellForRowAt:indexPath)
        case .Add:
            let tableCell = UITableViewCell(style: .default, reuseIdentifier: nil)
            tableCell.textLabel?.text = "+"
            return tableCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let category = self.category else {
            return
        }
        
        switch Section(rawValue: indexPath.section)! {
        case .Categories:
            let nextVC = ListViewController()
            nextVC.category = category.subCategories[indexPath.row]
            self.navigationController?.pushViewController(nextVC, animated: true)
        case .Exercises:
            return
        case .Add:
            guard let category = self.category else {
                return
            }
            let alert = UIAlertController(title: nil, message: "Add", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Category", style: .default, handler: { _ in
                let newCategory = Category()
                newCategory.title = "New Cat"
                category.subCategories.append(newCategory)
                tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Exercise", style: .default, handler: { _ in
                let newExercise = Exercise()
                newExercise.title = "New Ex"
                category.exercises.append(newExercise)
                tableView.reloadData()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

