//
//  WalletViewController.swift
//  ECS189E
//
//  Created by Jack Feng on 11/6/18.
//  Copyright © 2018 Zhiyi Xu. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myWallet.accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let account = self.myWallet.accounts[indexPath.row]
        print(account)
        print("tableView account")
        //let total = self.myWallet.totalAmount
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        cell.leftLabel.text = account.name
        cell.rightLabel.text = String(account.amount)
        return cell
    }

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var total: UILabel!

    @IBOutlet weak var accountTableView: UITableView!
    var myWallet = Wallet.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        Api.user { (response, error) in
            guard response != nil, error == nil else {
                return
            }

            if let res = response{
                self.myWallet = Wallet.init(data: res, ifGenerateAccounts: true)


            } else {
                print("api.user no response")
            }
        }
        walletShow()
        self.accountTableView.reloadData()
    }


    func walletShow(){
        
        if let user = myWallet.userName{
            userName.text = user
            total.text = String(myWallet.totalAmount)
        }
    }
}



