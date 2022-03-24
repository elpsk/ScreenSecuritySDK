//
//  ScreenRecordingObserver.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

class ScreenRecordingObserver: Observable {

    func observe( _ completion: ObservableResponse ) {
        NotificationCenter.default.addObserver(forName: Constants.screenRecordingNotification, object: nil, queue: OperationQueue.main) { _ in
            completion?(nil, UIScreen.main.isCaptured)
        }
    }

}
