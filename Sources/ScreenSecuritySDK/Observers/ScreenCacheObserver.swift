//
//  ScreenCacheObserver.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

class ScreenCacheObserver: Observable {

    func observe(_ completion: ObservableResponse) {}

    func observe( type: Any, completion: ObservableResponse ) {
        switch type as! AppDelegateListenType {
        case .didBecomeActive, .willEnterForeground:
            completion?(nil, false)
        case .willResignActive, .didEnterBackground:
            completion?(nil, true)
        }
    }

}
