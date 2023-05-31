//
//  splashcontroller.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit
import Lottie

class splashcontroller: UIViewController {

    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         animationView = .init(name: "splashlottie")
         animationView!.frame = view.bounds
         animationView!.contentMode = .scaleAspectFit
         animationView!.loopMode = .loop
         animationView!.animationSpeed = 0.8
         view.addSubview(animationView!)
         animationView!.play()


        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4){
            self.performSegue(withIdentifier: "OpenHome", sender: nil)
        }
        
    }
    

}
