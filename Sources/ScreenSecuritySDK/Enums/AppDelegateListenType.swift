//
//  AppDelegateListenType.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

/// App delegate callbacks
public enum AppDelegateListenType: Int {
    case didBecomeActive
    case willResignActive
    case willEnterForeground
    case didEnterBackground
}
