//
//  LoadingView.swift
//  SnapShotSample
//
//  Created by Alexandre  Vassinievski on 05/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class LoadingView: UIView {

    private var didSetupViews: Bool = false

    var lottieView: AnimationView?

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupViews()
        self.accessibilityIdentifier = "loading_view"
    }

    func show() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        }
        lottieView?.play()
    }

    func hide() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.0
        }
        lottieView?.stop()
    }

    private func setupViews() {
        if !didSetupViews {
            self.didSetupViews = true
            self.setupConstraints()
        }
    }

    private func setupConstraints() {
        self.lottieView = AnimationView(name: "loading")
        self.addSubview(lottieView!)

        lottieView?.alpha = 0.8
        lottieView?.constraintWidth(120.0)
        lottieView?.constraintHeight(120.0)
        lottieView?.prepareForConstraints()
        lottieView?.centerHorizontally()
        lottieView?.centerVertically()
        lottieView?.loopMode = .loop

        self.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }

}
