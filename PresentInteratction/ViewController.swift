//
//  ViewController.swift
//  PresentInteratction
//
//  Created by Jin Hong Jeon on 2018. 6. 16..
//  Copyright © 2018년 Jin Hong Jeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
      break
      
    case .changed:
      break
      
    case .cancelled:
      break
      
    case .ended:
      break
      
    default:
      break
    }
  }


}

