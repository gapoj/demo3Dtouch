//
//  RootViewController.swift
//  Demo3DTouch
//
//  Created by Guillermo Apoj on 21/4/16.
//  Copyright © 2016 Guillermo Apoj. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "peekIdentifier"{
            if let  vc = segue.destinationViewController as? DetailfromStoryViewController{
              vc.texto = "Desde Peek"
            }
        
        }else if segue.identifier == "sinpeek"{
            if let  vc = segue.destinationViewController as? DetailfromStoryViewController{
                vc.texto = " "
            }

        
        }
    }
  

}
