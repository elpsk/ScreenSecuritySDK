//
//  Observable.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

typealias ObservableResponse = ((Any?, Bool) -> Void)?

@objc protocol Observable {
    func observe( _ completion: ObservableResponse )
    @objc optional func observe( type: Any, completion: ObservableResponse )
    @objc optional func observeScreenshot( lockedView: UIView, completion: ObservableResponse )
}
