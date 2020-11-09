//
//  ProfileViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/23/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFreeMembership: UILabel!
    @IBOutlet weak var viewUpgradeToPro: MyView!
    @IBOutlet weak var viewSkinfyPro: MyView!
    @IBOutlet weak var tableView: UITableView!
    
    struct CellData {
        let imageName: String
        let label: String
        var hasSwitch: Bool = false
    }
    
    private let data: [CellData] = [
        CellData(imageName: "ic_pencil_black", label: "Edit Profile"),
        CellData(imageName: "ic_lock_smaller", label: "Change Password"),
        CellData(imageName: "ic_bell", label: "Push Notifications", hasSwitch: true),
        CellData(imageName: "ic_archive", label: "Archived Products"),
        CellData(imageName: "ic_subdirectory_arrow_left", label: "Logout")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let identifier = String(describing: ProfileTableViewCell.self)
        tableView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userData = UserDataManager().userData()
        let firstName = userData?.firstName ?? ""
        let lastName = userData?.lastName ?? ""
        lblFullname.text = firstName + " " + lastName
        lblEmail.text = userData?.email
        let membershipType = userData?.typeAccount
        if membershipType == "free" {
            setUIForPro(isPro: false)
        } else {
            setUIForPro(isPro: true)
        }
        
        profileAPI()
    }
    
    /**
     Used to show the UI for Pro or Free
     */
    private func setUIForPro(isPro: Bool) {
        lblFreeMembership.isHidden = isPro
        viewUpgradeToPro.isHidden = isPro
        viewSkinfyPro.isHidden = !isPro
    }
    
    private func updateDetails(profileData: ProfileAPIDataModel) {
        lblFullname.text = profileData.firstName + " " + profileData.lastName
        lblEmail.text = profileData.email
        setUIForPro(isPro: profileData.typeAccount != "free")
    }

}

//MARK: - Table View Data Source & Delegate
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
        let data = self.data[indexPath.row]
        if (data.hasSwitch) {
            cell.switchCustom.isHidden = false
            cell.switchCustom.isOn = true
        } else {
            cell.switchCustom.isHidden = true
        }
        cell.btnIcon.setImage(UIImage(named: data.imageName), for: .normal)
        cell.lblLabel.text = data.label
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        switch index {
        case 0:
            //edit profile
            let vc = EditProfileViewController.initFromNib()
            HomeTabController.sharedInstance.showTabBar(show: false)
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            //change password
            let vc = ChangePasswordViewController.initFromNib()
            HomeTabController.sharedInstance.showTabBar(show: false)
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            //archived products
            let vc = ArchivedProductsViewController.initFromNib()
            HomeTabController.sharedInstance.showTabBar(show: false)
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            //logout
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                UserDataManager().clearUserData()
                HomeTabController.sharedInstance.selectedIndex = 0
                SocialAuth().facebookLogout()
                Helper.goToLoginScreen()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
                
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }            
        default:
            break
        }
    }
    
}

//MARK: - APIs
extension ProfileViewController {
    func profileAPI() {
        APISession().profile().done { (result) in
            self.updateDetails(profileData: result.data)
        }.catch { (error) in
            let errorMessage = Helper.parseErrorMessage(error: error)
            Helper.showAlert(vc: self, title: "", message: errorMessage.message)
        }
    }
}
