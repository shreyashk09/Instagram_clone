//
//  ProfileVC.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 10/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITabBarDelegate{
    
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
         setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
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

