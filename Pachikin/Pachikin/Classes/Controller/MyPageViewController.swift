//
//  MyPageViewController.swift
//  Pachikin
//
//  Created by uzaki kota on 2018/01/20.
//  Copyright © 2018年 uzaki kota. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var target: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        target.layer.cornerRadius = 50
        target.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
