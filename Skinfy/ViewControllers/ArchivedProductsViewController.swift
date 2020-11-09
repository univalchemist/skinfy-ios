//
//  ArchivedProductsViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ArchivedProductsViewController: UIViewController {

    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var tableView: UITableView!
    
    let tmpProducts: [Product] = [
        Product(title: "", name: "", isArchived: true),
        Product(title: "", name: "", isExpired: true, isArchived: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        let identifier = String(describing: ProductTableViewCell.self)
        tableView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
    }
    
    @objc func onBtnBack() {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popViewController(animated: true)
    }

}

extension ArchivedProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmpProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        cell.data = tmpProducts[indexPath.row]
        return cell
    }
    
    
}
