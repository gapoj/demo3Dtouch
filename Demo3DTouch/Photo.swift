//
//  ViewController.swift
//  prueba3dtouch
//
//  Created by Guillermo Apoj on 1/4/16.
//  Copyright © 2016 Guillermo Apoj. All rights reserved.
//
import UIKit

struct Photo {

    let caption:String
    let imageName:String
    let city:String
    var meGustatext = " "
    init( caption:String, imageName:String, city:String ){
        
        self.caption = caption
        self.imageName = imageName
        self.city = city
        
    }
    
}
