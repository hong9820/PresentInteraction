//
//  ViewController.swift
//  PresentInteratction
//
//  Created by Jin Hong Jeon on 2018. 6. 16..
//  Copyright © 2018년 Jin Hong Jeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let interactor = Interactor()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /**
   EdgePanGestureRecognizer 동작을 설정한다.
   
   Parameters:
   - view: EdgePanGesture 동작을 추가할 뷰
   */
  func setupBackGesture(view: UIView) {
    let swipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackGesture(_:)))
    swipeGesture.edges = .left
    view.addGestureRecognizer(swipeGesture)
  }
  
  @IBAction func presentButtonTouched(_ sender: Any) {
    let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "presentVC") as! PresentViewController
    destination.interactor = self.interactor
    destination.transitioningDelegate = destination
    self.present(destination, animated: true, completion: nil)
  }
  
  /**
   Gesture에 대한 동작을 설정한다.
   
   Parameters:
   - gesture: EdgePanGesture 동작의 결과값
   */
  @objc func handleBackGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {
    //gesture가 작동하는 view
    let translation = gesture.translation(in: view)
    //EdgePanGesture로 얼마나 이동했는지 계산함
    let progress = translation.x / self.view.frame.width
    print(progress)
    
    //gesture 상태에 따른 동작
    switch gesture.state {
    case .began:
      self.interactor.hasStarted = true
      break
      
    case .changed:
      self.interactor.shouldFinish = progress > 0.5
      self.interactor.update(progress)
      break
      
    case .cancelled:
      self.interactor.hasStarted = false
      self.interactor.cancel()
      break
      
    //EdgePanGesture 종료 시점에 gesture가 적용된 view가 50%를 넘어가면 finish, 아니면 cancel
    case .ended:
      self.interactor.hasStarted = false
      self.interactor.shouldFinish ? self.interactor.finish() : self.interactor.cancel()
      break
      
    default:
      break
    }
  }


}

