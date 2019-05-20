//
//  batdau.swift
//  FlappyBird
//
//  Created by HaiPhan on 4/12/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class batdau: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Super Mario, The Selection, Dogs.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chuyenmanhinh(_ sender: UIButton) {
        let manhinhbatdau = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "play") as! ViewController
        manhinhbatdau.deplay = 1
        self.navigationController?.pushViewController(manhinhbatdau, animated: true)
    }
    @IBAction func medium(_ sender: Any) {
        let manhinhbatdau = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "play") as! ViewController
        manhinhbatdau.deplay = 0.1
        self.navigationController?.pushViewController(manhinhbatdau, animated: true)
        
    }
    @IBAction func hight(_ sender: Any) {
        let manhinhbatdau = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "play") as! ViewController
        manhinhbatdau.deplay = 0.01
        self.navigationController?.pushViewController(manhinhbatdau, animated: true)
    }
    

}
