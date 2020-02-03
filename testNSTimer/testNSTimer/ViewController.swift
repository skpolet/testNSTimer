//
//  ViewController.swift
//  testNSTimer
//
//  Created by Sergey Mikhailov on 03.02.2020.
//  Copyright © 2020 Sergey Mikhailov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButton.action = #selector(reload(sender:))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @objc func reload(sender: UIBarButtonItem) {
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell", for:indexPath)
        cell.layoutIfNeeded()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        
        self.addChild(vc)
        cell.contentView.addSubview(vc.view)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addConstraint(NSLayoutConstraint(item: vc.view!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell.contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0.0))
        cell.contentView.addConstraint(NSLayoutConstraint(item: vc.view!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell.contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0.0))
        cell.contentView.addConstraint(NSLayoutConstraint(item: vc.view!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell.contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0))
        cell.contentView.addConstraint(NSLayoutConstraint(item: vc.view!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell.contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0))
        
        vc.didMove(toParent: self)
        vc.view.layoutIfNeeded()
        
        return cell
    }
}

