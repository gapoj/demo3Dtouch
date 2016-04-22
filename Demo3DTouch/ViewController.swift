//
//  ViewController.swift
//  prueba3dtouch
//
//  Created by Guillermo Apoj on 1/4/16.
//  Copyright © 2016 Guillermo Apoj. All rights reserved.
//

import UIKit
import ContactsUI.UIApplicationShortcutIcon_Contacts
class ViewController: UIViewController {
    
    @IBOutlet weak var forceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first { //por las dudas si es nil //  el device no soporta 3d touch
            //if #available(iOS 9.0, *){ // verifico que estamos en ios 9 o superior
            if traitCollection.forceTouchCapability == UIForceTouchCapability.Available{//  el device soporta 3d touch
                
                let force = touch.force/touch.maximumPossibleForce//fuerza utilizada sobre fuerza maxima
                let grams = force * 385
                let roundGrams = Int(grams)
                forceLabel.text = "\(roundGrams) gramos"
                
                
            }
            // }
            
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        forceLabel.text = "0 gramos"
    }
    
    
    @IBAction func crearShortcuts(sender: AnyObject) {
        //Initialized with the UIApplicationShortcutIconType enum
        let enumIcon = UIApplicationShortcutIcon(type: .Search)
        
        //Initialized with a template image. Similar to UIImage
        let suppliedImageIcon = UIApplicationShortcutIcon(templateImageName: "Spoon")
        
        let shortcutItemNumbaOne = UIApplicationShortcutItem(type:TestShortcutType.AbrirDynamicIcon.type, localizedTitle: "Dinamico 1", localizedSubtitle: "creado con UIApplicationShortcutIcon(type: .Search)", icon: enumIcon, userInfo: nil)
        let shortcutItemNumbaTwo = UIApplicationShortcutItem(type: TestShortcutType.AbrirDynamicPhoto.type, localizedTitle: "Dinamco con foto", localizedSubtitle: "creado con UIApplicationShortcutIcon(templateImageName: \"Spoon\")", icon: suppliedImageIcon, userInfo: nil)
        UIApplication.sharedApplication().shortcutItems = [shortcutItemNumbaOne, shortcutItemNumbaTwo]
        
        ///“You can, alternatively, pass in a CNContact object you create at runtime. Such a contact must have at least a first name or a last name. The quick action icon returned from this method is then a monogram built from the contact’s name. With this approach, it is not possible for you to provide an image for the quick action icon.”
        // MUST remember to import the ContactsUI framework in your project and put the import ContactsUI.UIApplicationShortcutIcon_Contacts at the top of the file you are creating your Shortcut Items. Without it, your app will quit with an "unrecognized selector sent to class" crash. Perhaps you would try to create a CNMutableContact, assign it some imageData, and then use that contact without having to save it to your address book.
        let store = CNContactStore()
        
        do{
            let contacts = try store.unifiedContactsMatchingPredicate(CNContact.predicateForContactsMatchingName("Guillermo Apoj"), keysToFetch:[CNContactGivenNameKey])
            if let contact = contacts.first {
                let contactIcon = UIApplicationShortcutIcon(contact: contact)
                let shortcutItemNumba3 = UIApplicationShortcutItem(type: TestShortcutType.AbrirDynamicContact.type, localizedTitle: "Dinamco con Contacto", localizedSubtitle: "creado con UIApplicationShortcutIcon(contact: contact)", icon: contactIcon, userInfo: nil)
                UIApplication.sharedApplication().shortcutItems = [shortcutItemNumbaOne, shortcutItemNumbaTwo, shortcutItemNumba3]
                
            }
        }catch{
            print ("error creando icono con contacto")
        }
    }
}