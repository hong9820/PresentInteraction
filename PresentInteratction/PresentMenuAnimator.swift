//
//  PresentMenuAnimator.swift
//  PresentInteratction
//
//  Created by Jin Hong Jeon on 2018. 6. 16..
//  Copyright © 2018년 Jin Hong Jeon. All rights reserved.
//

import UIKit

class PresentMenuAnimator : NSObject {
  
}

extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromViewController = transitionContext.viewController(forKey: .from),
      let toViewController = transitionContext.viewController(forKey: .to)
      else { return }
    
    let containerView = transitionContext.containerView
    //toView를 추가하는데 fromView 뒤로 간다. 화면 제스쳐가 안끊기게 하기 위해서. 이러한 형태를 containerview에 추가하여 구성함
    containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
    
    UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
      fromViewController.view.frame.origin.x += UIScreen.main.bounds.width
    }) { _ in
      fromViewController.view.removeFromSuperview()
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
  }
}
