//
//  QuickTimeObserver.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit
import AVKit

class QuickTimeObserver: Observable {

    func observe( _ completion: ObservableResponse ) {
        NotificationCenter.default.addObserver(forName: Constants.quickTimeNotification, object: nil, queue: OperationQueue.main) { _ in
            let asRoute = AVAudioSession.sharedInstance().currentRoute
            for output in asRoute.outputs {
                print( "PORT: \(output.portType)" )
                completion?(output.portType, output.portType == AVAudioSession.Port.HDMI)
            }
        }
    }

}
