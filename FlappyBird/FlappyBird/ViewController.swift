//
//  ViewController.swift
//  FlappyBird
//
//  Created by HaiPhan on 4/12/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var lbltraitim: UILabel!
    @IBOutlet weak var ongtren3: UIImageView!
    @IBOutlet weak var ongtren2: UIImageView!
    @IBOutlet weak var ongtren1: UIImageView!
    @IBOutlet weak var btplay: UIButton!
    @IBOutlet weak var btreset: UIButton!
    @IBOutlet weak var ongduoi3: UIImageView!
    @IBOutlet weak var ongduoi2: UIImageView!
    @IBOutlet weak var ongduoi1: UIImageView!
    @IBOutlet weak var conhim: UIImageView!
    @IBOutlet weak var batdau: UIButton!
    @IBOutlet weak var lblkq: UILabel!
    var timer = Timer()
    @IBOutlet var viewui: UIView!
    var deplay : Double = 0.0
    var loadaudio : AVAudioPlayer!
    var count : Int = 0
    let image_tratim : UIImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "58376350_305306473717427_7054740657084039168_n.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        ongduoi1.frame.origin.x = 450
        ongduoi1.frame.origin.y = 550
        ongtren1.frame.origin.x = ongduoi1.frame.origin.x
        ongtren1.frame.origin.y = ongduoi1.frame.origin.y - 200 - 862
        ongduoi2.frame.origin.x = ongduoi1.frame.origin.x + 90 + 200
        ongduoi2.frame.origin.y = 550
        ongtren2.frame.origin.x = ongduoi2.frame.origin.x
        ongtren2.frame.origin.y = ongduoi2.frame.origin.y - 200 - 862
        //Ẩn ống 3, do màn hình nhỏ quá
//        ongduoi3.frame.origin.x = ongduoi2.frame.origin.x + 150 + 60
//        ongduoi3.frame.origin.y = 550
//        ongtren3.frame.origin.x = ongduoi3.frame.origin.x
//        ongtren3.frame.origin.y = ongduoi3.frame.origin.y - 200 - 862
        lblkq.text = "0"
        //set up image trai tim
        image_tratim.image = UIImage (named: "kisspng-heart-red-clip-art-heart-shape-clipart-5aa923d4078ce8.2947172315210341960309.png")
        self.viewui.addSubview(image_tratim)
        lbltraitim.text = "0"


    }
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func batdau(_ sender: UIButton) {
        btreset.isEnabled = false
        btplay.isEnabled = false
//        conhim.frame.origin.y -= 1
        timer = Timer.scheduledTimer(timeInterval: deplay, target: self, selector: #selector(ViewController.roixuong), userInfo: nil, repeats: true)

    }
    @objc func roixuong(){
        var sodiem : Int = Int(lblkq.text!)!
        //count trái tim
        var counttraitm : Int = Int(lbltraitim.text!)!
        // Di chuyển ống
        ongduoi1.frame.origin.x -= 10
        ongduoi2.frame.origin.x -= 10
        ongduoi3.frame.origin.x -= 10
        ongtren1.frame.origin.x -= 10
        ongtren2.frame.origin.x -= 10
        ongtren3.frame.origin.x -= 10
        
        image_tratim.isHidden = false
        
        //di chuyển trái tim
        image_tratim.frame.origin.x -= 10
        
        // tạo ông khói lại & random height của nó
        if ongduoi1.frame.origin.x == -90 {
            ongduoi1.frame.origin.x = 450
            ongduoi1.frame.origin.y = CGFloat(arc4random()%350) + 300
            ongtren1.frame.origin.x = ongduoi1.frame.origin.x
            ongtren1.frame.origin.y = ongduoi1.frame.origin.y - 200 - 862
            sodiem = sodiem + 1
            lblkq.text = String(sodiem)
        }else if ongduoi2.frame.origin.x == -90{
            ongduoi2.frame.origin.x = ongduoi1.frame.origin.x + 90 + 200
            ongduoi2.frame.origin.y = CGFloat(arc4random()%350) + 300
            ongtren2.frame.origin.x = ongduoi2.frame.origin.x
            ongtren2.frame.origin.y = ongduoi2.frame.origin.y - 200 - 862
            sodiem = sodiem + 1
            lblkq.text = String(sodiem)
            if sodiem%10 == 0 {
                UIView.beginAnimations(nil, context: nil)
                UIView.setAnimationDuration(3)
                randomtraiim()
                UIView.commitAnimations()
            }
//        }else if ongduoi3.frame.origin.x == -90{
//            ongduoi3.frame.origin.x = ongduoi2.frame.origin.x + 90 + 60
//            ongduoi3.frame.origin.y = CGFloat(arc4random()%500) + 200
//            ongtren3.frame.origin.x = ongduoi3.frame.origin.x
//            ongtren3.frame.origin.y = ongduoi3.frame.origin.y - 200 - 862
//            sodiem = sodiem + 1
//            lblkq.text = String(sodiem)
        }
        
        //di chuyển con chim
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        conhim.frame.origin.y += 10
        UIView.commitAnimations()


        
        //Kiểm tra con chim đụng ống
        var boundconchim = conhim.convert(conhim.bounds, to: nil)
        var boundongduoi1 = ongduoi1.convert(ongduoi1.bounds, to: nil)
        var boundongduoi2 = ongduoi2.convert(ongduoi2.bounds, to: nil)
        var boundonguoi3 = ongduoi3.convert(ongduoi3.bounds, to: nil)
        var conchim_ongduoi = conhim.frame.intersects(ongduoi1.frame)
        var conchim_ongduoi2 = conhim.frame.intersects(ongduoi2.frame)
        var conchim_ongduoi3 = conhim.frame.intersects(ongduoi3.frame)
        var bound_ongtren1 = ongtren1.convert(ongtren1.bounds, to: nil)
        var conchim_ongtren1 = conhim.frame.intersects(ongtren1.frame)
        var bound_ongtren2 = ongtren2.convert(ongtren2.bounds, to: nil)
        var conchim_ongtren2 = conhim.frame.intersects(ongtren2.frame)
        var bound_traintim = image_tratim.convert(image_tratim.bounds, to: nil)
        var traitim_ongtren1 = image_tratim.frame.intersects(ongtren1.frame)
        var traintim_ongtren2 = image_tratim.frame.intersects(ongtren2.frame)
        var traitim_ongduoi1 = image_tratim.frame.intersects(ongduoi1.frame)
        var traitim_ongduoi2 = image_tratim.frame.intersects(ongduoi2.frame)
        var conchim_traitim = conhim.frame.intersects(image_tratim.frame)
        if (conchim_ongduoi && self.count <= 0)  || (conchim_ongduoi2 && self.count <= 0) || (conchim_ongtren1 && self.count <= 0) || (conchim_ongtren2 && self.count <= 0) {
            // Kiểm tra nếu con chim đụng ống nước và count <= 0 thì hết game
            timer.invalidate()
            //hiện button Reset
            btreset.isEnabled = true
            //Ẩn button Play
            btplay.isEnabled = false
            //Setup Animation tới điểm y = 1000
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            self.conhim.frame.origin.y = 1000
            UIView.commitAnimations()
            //Setup & Play Audio
            var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
            var audiointi = URL.init(fileURLWithPath: audioover!)
            do{
                loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
            }catch{}
            loadaudio.play()


        }
        else if conchim_ongduoi || conchim_ongduoi2 || conchim_ongtren1 || conchim_ongtren2 {
            // Count sẽ bị trừ mỗi khi con chim đụng ống nước
            counttraitm = counttraitm - 2
            self.count = counttraitm
            lbltraitim.text = String(self.count)
        }
//        else if conchim_ongduoi2 || conchim_ongtren2 {
////            timer.invalidate()
//            btreset.isEnabled = true
//            btplay.isEnabled = false
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(0.3)
////            self.conhim.frame.origin.y = 1000
//            UIView.commitAnimations()
//            var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
//            var audiointi = URL.init(fileURLWithPath: audioover!)
//            do{
//                loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
//            }catch{ }
//            loadaudio.play()
//        }
//        else if conchim_ongduoi3{
////            timer.invalidate()
//            btreset.isEnabled = true
//            btplay.isEnabled = false
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(0.3)
////            self.conhim.frame.origin.y = 1000
//            UIView.commitAnimations()
//            var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
//            var audiointi = URL.init(fileURLWithPath: audioover!)
//            do{
//                loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
//            }catch{}
//            loadaudio.play()
//        }
//        else if self.conhim.frame.origin.y == self.viewui.frame.size.height - 28
//        {
////            timer.invalidate()
//            btreset.isEnabled = true
//            btplay.isEnabled = false
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(0.3)
////            self.conhim.frame.origin.y = 1000
//            UIView.commitAnimations()
//            var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
//            var audiointi = URL.init(fileURLWithPath: audioover!)
//            do{
//                loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
//            }catch{}
//            loadaudio.play()
//        }
//        else if conchim_ongtren1{
////            timer.invalidate()
//            btreset.isEnabled = true
//            btplay.isEnabled = false
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(0.3)
////            self.conhim.frame.origin.y = 1000
//            UIView.commitAnimations()
//            var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
//            var audiointi = URL.init(fileURLWithPath: audioover!)
//            do{
//                loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
//            }catch{}
//            loadaudio.play()
//            print("ong tren 1")
//        }
            //hien thị trai tim không trùng với ống
        else if traitim_ongtren1 || traintim_ongtren2 || traitim_ongduoi1 || traitim_ongduoi2 {
            image_tratim.frame.origin.x += 90
        }
        else if conchim_traitim {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(3)
            image_tratim.isHidden = true
            counttraitm += 1
            self.count = counttraitm
            lbltraitim.text = String(self.count)
            UIView.commitAnimations()
        }
 
        

    }
    
    @IBAction func nhaylen(_ sender: UITapGestureRecognizer) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        conhim.frame.origin.y -= 50
        UIView.commitAnimations()

    }
    @IBAction func choilai(_ sender: UIButton) {
        lblkq.text = "0"
        self.viewDidLoad()
        btplay.isEnabled = true
        deplay = 0.1
        conhim.frame.origin.x = 32
        conhim.frame.origin.y = 334
    }
    //hien thị random vị tri trai tim
    func randomtraiim(){
        image_tratim.frame.origin.x = CGFloat(arc4random()%10) + 500
        image_tratim.frame.origin.y = CGFloat(arc4random()%400) + 200
    }
    func conchimdungong(){
        timer.invalidate()
        btreset.isEnabled = true
        btplay.isEnabled = false
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        self.conhim.frame.origin.y = 1000
        UIView.commitAnimations()
        var audioover = Bundle.main.path(forResource: "MarioGameOverNhacChuong-VA-4731955", ofType: ".mp3")
        var audiointi = URL.init(fileURLWithPath: audioover!)
        do{
            loadaudio = try? AVAudioPlayer(contentsOf: audiointi)
        }catch{}
        loadaudio.play()
        print("ban thua")
    }
    
}

