//
//  Compatibility.swift
//  Perform
//
//  Created by Patrick Montalto on 3/7/19.
//  Copyright © 2019 thoughtbot. All rights reserved.
//

import UIKit

#if !swift(>=4.2)
extension UIViewController {
  var children: [UIViewController] {
    return childViewControllers
  }
}
extension UIApplication {
  typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
}
#endif
