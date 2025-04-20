//
//  ViewController.swift
//  TinderSwiper
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

class SwipingViewController: UIViewController {

    private var profileViews: [TrustCardView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random
        setupProfiles()
    }

    private func setupProfiles() {
        for (index, profile) in sampleProfiles.reversed().enumerated() {
            let card = TrustCardView(profile: profile)
            card.frame = CGRect(x: 20, y: 100,
                                width: view.frame.width - 40,
                                height: 400)
            card.tag = index
            view.addSubview(card)
            profileViews.append(card)
            addPanGesture(to: card)
        }
    }

    private func addPanGesture(to card: TrustCardView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        card.addGestureRecognizer(pan)
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let card = gesture.view as? TrustCardView else { return }
        let translation = gesture.translation(in: view)
        let percent = translation.x / view.bounds.width
        let rotation = percent * CGFloat.pi / 8

        switch gesture.state {
        case .changed:
            card.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
                .rotated(by: rotation)
        case .ended:
            let shouldDismiss = abs(translation.x) > 100
            UIView.animate(withDuration: 0.3, animations: {
                if shouldDismiss {
                    let offScreenX = translation.x > 0 ? self.view.frame.width : -self.view.frame.width
                    card.center = CGPoint(x: offScreenX * 2, y: card.center.y)
                    card.alpha = 0
                } else {
                    card.transform = .identity
                }
            }, completion: { _ in
                if shouldDismiss {
                    card.removeFromSuperview()
                }
            })
        default:
            break
        }
    }
}


