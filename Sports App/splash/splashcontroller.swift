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
        
        // 2. Start AnimationView with animation name (without extension)
         animationView = .init(name: "splashlottie")
         animationView!.frame = view.bounds
         // 3. Set animation content mode
         animationView!.contentMode = .scaleAspectFit
         // 4. Set animation loop mode
         animationView!.loopMode = .loop
         // 5. Adjust animation speed
         animationView!.animationSpeed = 0.8
         view.addSubview(animationView!)
         // 6. Play animation
         animationView!.play()


        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4){
            self.performSegue(withIdentifier: "OpenHome", sender: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
