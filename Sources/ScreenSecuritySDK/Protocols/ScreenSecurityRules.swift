//
//  ScreenSecurityRules.swift
//  Created by Pasca Alberto on 24/03/22.
//

import UIKit

public class ScreenSecurityRules {

    public typealias InitHandler = ((ScreenSecurityRules) -> (Void))
    
    public init(_ handler: InitHandler? = nil) {
        handler?(self)
    }
    
    /// the type of check to use
    public var type: SecurityIdentifierType = .unknown
    
    /// can be optional if you use "autoBlur" configuration
    public var callback: ((Any?, Bool) -> Void)?
    
    /// sceneDelegate is mandatory for using SecurityType.screenCache rule
    public var sceneDelegate: UISceneDelegate?

    /// appDelegate is mandatory for using SecurityType.screenCache rule
    public var appDelegate: UIApplicationDelegate?

}
