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
  
}
