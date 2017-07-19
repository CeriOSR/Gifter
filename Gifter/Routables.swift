//
//  Routables.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-19.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FBSDKLoginKit

class Routable: NSObject, RoutableProtocol {
    
    let uid = Auth.auth().currentUser?.uid
    
    
    func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(top)
            } else if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
}

