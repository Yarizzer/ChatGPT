//
//  CircleTransitionAnimator.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 13.03.2023.
//

import UIKit

class CircleShapeTransitionAnimator: NSObject {
    init(isPresenting presenting: Bool, transitionPoint point: CGPoint) {
        self.isPresenting = presenting
        self.transitionPoint = point
    }
    
    private func present(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let presentedVC = transitionContext.viewController(forKey: .to), let presentedView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            
            return
        }
        
        let finalFrame = transitionContext.finalFrame(for: presentedVC)
        
        presentedView.frame = AppCore.shared.deviceManager.screenSize
        presentedView.center = transitionPoint
        
        let circleView = createCircleView(forView: presentedView)
        circleView.center = transitionPoint
        circleView.alpha = 0
        
        containerView.addSubview(circleView)
        
        presentedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        presentedView.alpha = 0
        containerView.addSubview(presentedView)
        
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
            presentedView.frame = finalFrame
            
            circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
            circleView.center = presentedView.center
            
            presentedView.alpha = 1
            circleView.alpha = 1
        }) { finished in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
    }
    
    private func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let dismissedView = transitionContext.view(forKey: .from), let presentedView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            
            return
        }
        
        containerView.insertSubview(presentedView, belowSubview: dismissedView)
        
        let circleView = createCircleView(forView: dismissedView)
        circleView.center = presentedView.center
        containerView.insertSubview(circleView, belowSubview: dismissedView)
        
        UIView.animate(withDuration: Constants.animationDuration, animations: { [weak self] in
            guard let sSelf = self else { return }
            
            dismissedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            dismissedView.center = sSelf.transitionPoint
            
            circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            circleView.center = sSelf.transitionPoint
            
            dismissedView.alpha = 0
            circleView.alpha = 0
        }) { (finished) in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
    }
    
    private func createCircleView(forView view: UIView) -> UIView {
        let d = sqrt(pow(view.bounds.width, 2) + pow(view.bounds.height, 2))
        let circleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: d, height: d)))
        circleView.layer.cornerRadius = d / 2
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = AppCore.shared.styleManager.colorGray
        
        if isPresenting {
            circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }
        
        return circleView
    }
    //MARK: - Prop's
    private var isPresenting: Bool
    private let transitionPoint: CGPoint
}

extension CircleShapeTransitionAnimator: UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            self.present(using: transitionContext)
        } else {
            self.dismiss(using: transitionContext)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.animationDuration
    }
}

extension CircleShapeTransitionAnimator {
    private struct Constants {
        static let animationDuration: Double = 0.5
    }
}
