//
//  BlurView.swift
//  Created by Pasca Alberto, IT on 24/03/22.
//

import UIKit

class BlurView {

    private var window: UIWindow
    private var screen: UIView?
    private var customOverlay: UIView?
    private var autoBlur: Bool = true

    init( window: UIWindow, customOverlay: UIView?, autoBlur: Bool = true ) {
        self.window = window
        self.customOverlay = customOverlay
        self.autoBlur = autoBlur
    }

    func toggleBlur( _ status: Bool ) {
        if autoBlur {
            if status {
                blurScreen()
            } else {
                removeBlurScreen()
            }
        }
    }

    func blurScreen( style: UIBlurEffect.Style = UIBlurEffect.Style.regular ) {
        if let customOverlay = customOverlay {
            screen = customOverlay
        }
        
        if let addedScreen = screen {
            if window.subviews.contains(addedScreen) {
                return
            }
        }

        screen?.removeFromSuperview()
        
        if customOverlay == nil || self.autoBlur {
            screen = UIScreen.main.snapshotView(afterScreenUpdates: false)
            
            let blurEffect = UIBlurEffect(style: style)
            let blurBackground = UIVisualEffectView(effect: blurEffect)
            screen?.addSubview(blurBackground)
            blurBackground.frame = (screen?.frame)!
        }
        
        window.addSubview(screen!)
    }
    
    func removeBlurScreen() {
        screen?.removeFromSuperview()
    }

}
