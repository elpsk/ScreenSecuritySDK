//
//  Constants.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit
import AVKit

class Constants {
    
    static let quickTimeNotification = AVAudioSession.routeChangeNotification
    static let screenRecordingNotification = UIScreen.capturedDidChangeNotification
    static let screenshotsNotification = UIApplication.userDidTakeScreenshotNotification
    
    static let externalDeviceConnected = UIScreen.didConnectNotification
    static let externalDeviceDisconnected = UIScreen.didDisconnectNotification

}
