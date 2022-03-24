//
//  MirroringObserver.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

class MirroringObserver: Observable {

    private var screenChanged: Bool = false

    func observe( _ completion: ObservableResponse ) {
//        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { t in
//            if UIScreen.screens.count > 1 {
//                self.screenChanged = true
//                completion?(UIScreen.screens.count, true)
//            } else {
//                if self.screenChanged {
//                    self.screenChanged.toggle()
//                    completion?(UIScreen.screens.count, false)
//                }
//            }
//        }

        NotificationCenter.default.addObserver(forName: Constants.externalDeviceConnected, object: nil, queue: OperationQueue.main) { _ in
            print( "Mirrored: \(String(describing: UIScreen.main.mirrored))" )
            completion?(nil, UIScreen.main.isCaptured)
        }

        NotificationCenter.default.addObserver(forName: Constants.externalDeviceDisconnected, object: nil, queue: OperationQueue.main) { _ in
            print( "Mirrored: \(String(describing: UIScreen.main.mirrored))" )
            completion?(nil, UIScreen.main.isCaptured)
        }
    }

}
