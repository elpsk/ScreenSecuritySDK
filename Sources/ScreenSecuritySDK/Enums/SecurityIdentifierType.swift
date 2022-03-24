//
//  SecurityIdentifierType.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

public enum SecurityIdentifierType {
    /// Identify QuickTime video recording from macOS
    case quickTime

    /// Identify iOS screen recording
    case screenRecording
    
    /// Identify iOS screen sharing
    case mirroring

    /// Identify iOS automatic background screen cache
    case screenCache

    /// Identify an user taken screenshot
    case screenshot

    /// Default
    case unknown
}
