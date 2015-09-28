//
//  IndexViewController.swift
//  presoraka
//
//  Created by maqj on 15/8/18.
//  Copyright (c) 2015年 msxt. All rights reserved.
//

import UIKit

class IndexViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initNavigationView()
        
        let numbers = [1, 2, 3, 4, 5]
        
        let test = numbers.map(){
            $0
        }
        
        dispatch_async(dispatch_get_main_queue()){
        
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0)){
        
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
