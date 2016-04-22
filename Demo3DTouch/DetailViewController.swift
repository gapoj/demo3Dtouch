//
//  ViewController.swift
//  prueba3dtouch
//
//  Created by Guillermo Apoj on 1/4/16.
//  Copyright © 2016 Guillermo Apoj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

       // IBOutlets
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // Properties
    var photo:Photo?
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if let photo = photo {
         
            imageView.image = UIImage(named: photo.imageName)
            captionLabel.text = photo.caption
            
            title = photo.city
        }
        
    }
   
 
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
override func previewActionItems() -> [UIPreviewActionItem] {
     let likeAction = UIPreviewAction(title: "Me gusta", style: .Selected) { (action, viewController) ->
         Void    in
                print("me gusta")
        
    }
  
    let deleteAction = UIPreviewAction(title: "No me Gusta", style: .Destructive) { (action, viewController) -> Void in
       print("no me gusta")
        
      
    }
    let regularAction = UIPreviewAction(title: "Regular", style: .Default) { (action: UIPreviewAction, vc: UIViewController) -> Void in
        
    }
    
    let destructiveAction = UIPreviewAction(title: "Destructive", style: .Destructive) { (action: UIPreviewAction, vc: UIViewController) -> Void in
        
        
    }
    
    let actionGroup = UIPreviewActionGroup(title: "Group...", style: .Default, actions: [regularAction, destructiveAction])
    
    return [likeAction,  deleteAction, actionGroup]
    
}
    
}
