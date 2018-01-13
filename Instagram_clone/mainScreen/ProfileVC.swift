//
//  ProfileVC.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 10/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITabBarDelegate{
    //part-1
    @IBOutlet weak var layer1: UIStackView!
    @IBOutlet weak var layer2_1: UIStackView!
    @IBOutlet weak var layer2_2: UIStackView!
    @IBOutlet weak var layer1_2: UIStackView!
    //part-2
    @IBOutlet weak var viewTabBar: UIView!
    @IBOutlet weak var segmentProf: UISegmentedControl!
    var currentVC: UIViewController!
    let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    private lazy var CameraViewController: CameraViewController = {
        var viewController = storyBoard.instantiateViewController(withIdentifier: "camera") as! CameraViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    private lazy var MessagingViewController: MessagingViewController = {
        var viewController = storyBoard.instantiateViewController(withIdentifier: "messages") as! MessagingViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVC = CameraViewController
        selfProfSec()
         setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //part-I
    func selfProfSec(){
        profilePic()
        optionsProf()
    }
    func profilePic(){
    let ppic = UIImageView(frame: CGRect(x:0,y:0,width:60,height:60))
        ppic.image = UIImage(named: "prof2.jpeg")?.resizeImage(newWidth: 60,newHeight: 60)
        layer1.addArrangedSubview(ppic)
    }
    func optionsProf(){
        
        let tArray: [String:Int] = ["posts": 10, "followers": 100, "following": 50]
       // let fArray: [Int] = [10, 100, 50]
        var str1 = NSMutableAttributedString()
        
        for (str,val) in tArray {
            let lbl = UILabel(frame: CGRect(x:0,y:0,width:30,height:60))
            let val1 = String(val)
            str1 = NSMutableAttributedString(string: val1 + "\n" + str, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 18.0)!])
            //str1.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "AmericanTypewriter-Bold", size: 18.0)!, range: NSRange(location:0,length:val1.count))
            let x = String(str).count
            str1.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "AmericanTypewriter-Bold", size: 10.0)!, range: NSRange(location:val1.count,length: x))
    str1.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: NSRange(location:val1.count,length:x))
            lbl.attributedText = str1
            layer2_1.addArrangedSubview(lbl)
            layer1.addArrangedSubview(layer1_2)
        }
    }
    
    
    //part-II
    func setupView() {
        setupSegmentedControl()
        updateView()
    }
    private func setupSegmentedControl() {
        segmentProf.addTarget(SubProfileVC(), action: #selector(updateView), for: .valueChanged)
    }
    @objc private func updateView() {
        switch (segmentProf.selectedSegmentIndex) {
        case 1:
            remove(asChildViewController: currentVC)
            add(asChildViewController: MessagingViewController)
            currentVC = MessagingViewController
            print("profile segment 1")
            break
        case 2 :
            remove(asChildViewController: currentVC)
            add(asChildViewController: CameraViewController)
            currentVC = CameraViewController
            print("profile segment 2")
            break
        case 3 :
            remove(asChildViewController: currentVC)
            add(asChildViewController: MessagingViewController)
            currentVC = MessagingViewController
            print("profile segment 3")
            break
        case 0 :
            remove(asChildViewController: currentVC)
            add(asChildViewController: CameraViewController)
            currentVC = CameraViewController
            print("profile segment 0")
            break
        default:
            break
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChildViewController(viewController)
        viewTabBar.addSubview(viewController.view)
        viewController.view.frame = viewTabBar.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
}

