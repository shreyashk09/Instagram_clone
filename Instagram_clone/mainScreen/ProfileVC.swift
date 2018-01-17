//
//  ProfileVC.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 10/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITabBarDelegate,UIScrollViewDelegate{
    @IBOutlet weak var mainScroll: UIScrollView!
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
    
    private lazy var Seg2: Seg2 = {
        var viewController = storyBoard.instantiateViewController(withIdentifier: "Profileseg2") as! Seg2
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
        mainScroll.isScrollEnabled = true
        Seg2.tableView.isScrollEnabled = false
        mainScroll.bounces = false
        Seg2.tableView.bounces = false
        currentVC = Seg2
        selfProfSec()
         setupView()
        constraint()
        //scrollViewDidScroll(mainScroll)
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
       // var str1 = NSMutableAttributedString()
        
        for (str,val) in tArray {
            let str1 = " "+str
            let lbl = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 100))
            let astr = NSMutableAttributedString(string: str1, attributes: [
                NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                NSAttributedStringKey.font: UIFont(name: "Arial", size: 14.0)
                ] as [NSAttributedStringKey : Any])
            
            let astr1 = NSMutableAttributedString(string: "String(val)", attributes: [
                NSAttributedStringKey.foregroundColor: UIColor.black,
                NSAttributedStringKey.font: UIFont(name: "Arial", size: 24.0)
                ] as [NSAttributedStringKey : Any])
            astr1.append(astr)
            lbl.titleLabel?.attributedText = astr1
            lbl.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            lbl.titleLabel?.numberOfLines = 2
            lbl.setAttributedTitle(astr, for: .normal)
            lbl.backgroundColor = UIColor.blue
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
            add(asChildViewController: Seg2)
            currentVC = Seg2
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
            add(asChildViewController: Seg2)
            currentVC = Seg2
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
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat
    
    
    func scrollViewDidScroll(_ scrollview: UIScrollView) {
         let yOffset = mainScroll.contentOffset.y
        if yOffset == 0 {
            Seg2.tableView.isScrollEnabled = false
        }
        if yOffset >= 200 {
            Seg2.tableView.isScrollEnabled = true
        }
        if yOffset <= 200 {
            Seg2.tableView.isScrollEnabled = false
        }
        print("scrolling : \(yOffset)")
    }
  //  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let yOffset = scrollView.contentOffset.y
//        constraint(varH: yOffset)
//        print("y offset: \(yOffset)")
//            if yOffset >= 180{
//                mainScroll.isScrollEnabled = false
//                Seg2.tableView.isScrollEnabled = true
//            }
//
//            if yOffset < 180 {
//                mainScroll.isScrollEnabled = true
//                Seg2.tableView.isScrollEnabled = false
//            }
  //  }
    func constraint(){
        let heightConstraints =  viewTabBar.heightAnchor.constraint(equalToConstant: screenHeight)
        viewTabBar.addConstraints([heightConstraints])
        viewTabBar.updateConstraints()
        print("height: \(viewTabBar.frame.size.height)")
    }
}

