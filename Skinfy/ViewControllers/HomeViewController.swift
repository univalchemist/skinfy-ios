//
//  HomeViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/23/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var lblTotalProducts: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewGetFreeTrialBox: GetFreeTrialBoxView!
    @IBOutlet weak var imgHelpArrow: UIImageView!
    @IBOutlet weak var lblAddYourFirstProduct: UILabel!
    
    private var customTabBar: TabBar?
    
    private var selectedGroupCell: Int = 1
    
    //FIXME: temporary data
    let tmpData:[[String:String]] =
        [
            [
                "Create Group":""
            ],
            [
                "Daily Use":"12"
            ],
            [
                "Daily Stocked":"4"
            ],
            [
                "Daily Stocked":"6"
            ]
        ]
    
    var tmpProducts: [ExpandableSection] = [
        ExpandableSection(isExpanded: false, category: Category(id: 1, title: "Face", items: [
            Product(title: "Cetaphil | Face Wash", name: "Gentle Face Cleanser", isFinished: true, isArchived: true),
            Product(title: "Cetaphil | Face Wash", name: "Gentle Face Cleanser", isExpired: true)
        ])),
        ExpandableSection(isExpanded: false, category: Category(id: 2, title: "Body", items: [
            Product(title: "Cetaphil | Face Wash", name: "Gentle Face Cleanser")
        ])),
        ExpandableSection(isExpanded: false, category: Category(id: 3, title: "Hair", items: [
            Product(title: "Cetaphil | Face Wash", name: "Gentle Face Cleanser")
        ])),
        ExpandableSection(isExpanded: false, category: Category(id: 4, title: "Oral", items: [
        ])),
        ExpandableSection(isExpanded: false, category: Category(id: 5, title: "Other", items: [
        ])),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewGetFreeTrialBox.isHidden = true
        
        //collection view for the Group Boxes
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 80)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: GroupBoxCollectionCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: GroupBoxCollectionCell.self))
        collectionView.register(UINib(nibName: String(describing: CreateGroupBoxCollectionCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: CreateGroupBoxCollectionCell.self))
        
        //table view for the products
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: ProductTableHeaderView.self), bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: String(describing: ProductTableHeaderView.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //TODO: map to UI
        let userData = UserDataManager().userData()
        lblTitleName.text = "Hi " + (userData?.firstName ?? "")
        
        //TODO: show/hide help arrow depending if there are data
        showHelpArrow(show: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async {
            self.customTabBar = HomeTabController.sharedInstance.customTabBar
            self.customTabBar?.circularButtonView.onTap = self.onTapAddProduct
        }
        
    }

    
    func onTapAddProduct() {
        let view = AddProductButtonsView(frame: self.view.bounds)
        HomeTabController.sharedInstance.view.addSubview(view)
    }

    
    @IBAction func onBtnFilter(_ sender: Any) {
        let view = FilterView(frame: self.view.bounds)
        HomeTabController.sharedInstance.view.addSubview(view)
    }
    
    func showHelpArrow(show: Bool) {
        imgHelpArrow.isHidden = !show
        lblAddYourFirstProduct.isHidden = !show
    }
    
}

//MARK: - Collection View Data Source
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tmpData.count //TODO: temporary
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //FIXME: temporary handling of data
        let data:[String:String] = tmpData[indexPath.row]
        let key = data.first?.key
        let val = data.first?.value
        
        if (key == "Create Group") {
            let cell: CreateGroupBoxCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CreateGroupBoxCollectionCell.self), for: indexPath) as! CreateGroupBoxCollectionCell
            return cell
        } else {
            let cell: GroupBoxCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GroupBoxCollectionCell.self), for: indexPath) as! GroupBoxCollectionCell
            if (selectedGroupCell == indexPath.row) {
                cell.isSelected = true
            } else {
                cell.isSelected = false
            }
            cell.setNeedsLayout()
            cell.valueLbl.text = val
            cell.subtitleLbl.text = key
            return cell
        }
    }
}

//MARK: - Collection View Delegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        if (cell.isKind(of: GroupBoxCollectionCell.self)) {
            cell.isSelected = true
            selectedGroupCell = indexPath.row
        } else if (cell.isKind(of: CreateGroupBoxCollectionCell.self)) {
            let view = CreateGroupView(frame: self.view.bounds)
            HomeTabController.sharedInstance.view.addSubview(view)
        }
        collectionView.reloadData()
    }
    
    
}

//MARK: Table View Data Source & Delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tmpProducts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let expandableSection = tmpProducts[section]
        if (expandableSection.isExpanded) {
            return expandableSection.category.items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let expandableSection = tmpProducts[section]
        /*if (expandableSection.isExpanded) {
            return 50
        }*/
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let expandableSection = tmpProducts[section]
        let view = ProductTableHeaderView(reuseIdentifier: String(describing: ProductTableHeaderView.self))
        view.btnAction.addTarget(self, action: #selector(handleOpenCloseSection), for: .touchUpInside)
        view.btnAction.tag = section
        view.bottomLine.isHidden = expandableSection.isExpanded
        view.expandableSection = expandableSection
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self)) as! ProductTableViewCell
                
        cell.data = tmpProducts[indexPath.section].category.items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVC = ProductDetailsViewController.initFromNib()
        HomeTabController.sharedInstance.showTabBar(show: false)
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension HomeViewController {
    @objc func handleOpenCloseSection(button: UIButton) {
        let section = button.tag
        var indexPaths = [IndexPath]()
        let expandableSection = tmpProducts[section]
        if (!expandableSection.category.items.isEmpty) {
            //get all rows from this section
            for row in expandableSection.category.items.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            
            if (expandableSection.isExpanded) {
                //delete rows/close
                tmpProducts[section].isExpanded = false
                self.tableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                //expand rows
                tmpProducts[section].isExpanded = true
                self.tableView.insertRows(at: indexPaths, with: .fade)
            }
            //to refresh the header view (because it has a dynamic bottom line)
            tableView.reloadSections(IndexSet(integersIn: section...section), with: .fade)
        }
    }
}
