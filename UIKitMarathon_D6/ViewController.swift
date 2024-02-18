//
//  ViewController.swift
//  UIKitMarathon_D6
//
//  Created by Maksim Vaselkov on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var animator = UIDynamicAnimator(referenceView: view)

    private lazy var box: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = .init(width: 100, height: 100)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 12
        view.layer.cornerCurve = .continuous

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onViewTap(_:)))

        box.frame.origin = .init(x: view.center.x - box.frame.size.width / 2, y: view.center.y + 200)

        view.addGestureRecognizer(tapRecognizer)
        view.addSubview(box)
    }

    @objc
    private func onViewTap(_ sender: UIGestureRecognizer) {
        let location = sender.location(in: view)

        let behavior = UISnapBehavior(
            item: box,
            snapTo: location
        )

        behavior.damping = 0.5

        animator.removeAllBehaviors()
        animator.addBehavior(behavior)
    }
}

