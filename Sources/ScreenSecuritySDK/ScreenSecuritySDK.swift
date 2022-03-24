//
//  ScreenSecuritySDK
//  Created by Alberto Pasca on 24/03/22.
//

import UIKit

public class ScreenSecuritySDK {

    private var screen: UIView?
    private var window: UIWindow

    private var rules: [ScreenSecurityRules] = []
    private var autoBlur: Bool = false
    private var customOverlay: UIView?
    private var blurView: BlurView?

    private lazy var screenCacheObserver = ScreenCacheObserver()
    
    public init( _ window: UIWindow ) {
        self.window = window
    }
    
    public func configure( rules: [ScreenSecurityRules], autoBlur: Bool, customOverlay: UIView? = nil ) {
        self.rules = rules
        self.autoBlur = autoBlur
        self.customOverlay = customOverlay

        self.blurView = BlurView(
            window: self.window,
            customOverlay: customOverlay,
            autoBlur: autoBlur
        )

        startListenForNotifications()
    }
    
    public func listen( type: AppDelegateListenType ) {
        if let rule = self.rules.first(where: { $0.type == .screenCache }) {
            screenCacheObserver.observe(type: type) { arg, status in
                self.blurView?.toggleBlur(status)
                rule.callback?(arg, status)
            }
        }
    }

    private func startListenForNotifications() {
        if let rule = self.rules.first(where: { $0.type == .quickTime }) {
            let qtObserver = QuickTimeObserver()
            qtObserver.observe { arg, status in
                self.blurView?.toggleBlur(status)
                rule.callback?(arg, status)
            }
        }

        if let rule = self.rules.first(where: { $0.type == .screenRecording }) {
            let srObserver = ScreenRecordingObserver()
            srObserver.observe { arg, status in
                self.blurView?.toggleBlur(status)
                rule.callback?(arg, status)
            }
        }
        
        if let rule = self.rules.first(where: { $0.type == .screenshot }) {
            let ssObserver = ScreenshotsObserver()
            ssObserver.observe { arg, status in
                self.blurView?.toggleBlur(status)
                rule.callback?(arg, status)
            }
        }

        if let rule = self.rules.first(where: { $0.type == .mirroring }) {
            let mrrObserver = MirroringObserver()
            mrrObserver.observe { arg, status in
                self.blurView?.toggleBlur(status)
                rule.callback?(arg, status)
            }
        }
    }

}
