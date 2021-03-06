//
//  PresentViewController.swift
//  PresentInteratction
//
//  Created by Jin Hong Jeon on 2018. 6. 16..
//  Copyright © 2018년 Jin Hong Jeon. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
  
  var interactor: Interactor!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func backButtonTouched(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}

extension PresentViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentMenuAnimator()
  }
  
  func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    //넘겨받은 interactor의 hasStarted값을 확인하여 리턴함
    return interactor.hasStarted ? interactor : nil
  }
}
