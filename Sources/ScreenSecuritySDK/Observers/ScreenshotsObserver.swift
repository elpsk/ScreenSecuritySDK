//
//  ScreenshotsObserver.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

class ScreenshotsObserver: Observable {

    func observe( _ completion: ObservableResponse ) {
        NotificationCenter.default.addObserver(forName: Constants.screenshotsNotification, object: nil, queue: OperationQueue.main) { _ in
            completion?(nil, true)
        }
    }

}
