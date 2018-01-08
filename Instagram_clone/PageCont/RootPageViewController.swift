//
//  RootPageViewController.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 08/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var pageControl = UIPageControl()
    var pArray: [UIViewController] = {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let feeds = storyBoard.instantiateViewController(withIdentifier: "feeds")
        let camera = storyBoard.instantiateViewController(withIdentifier: "camera")
        let messages = storyBoard.instantiateViewController(withIdentifier: "messages")
        return [feeds,messages,camera]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
       // configurePageControl()
        if let firstViewController = pArray.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pArray.index(of: viewController) else {
            return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
             return pArray.last
        }
        guard previousIndex < pArray.count-2 else {
            return nil
        }
        guard pArray.count > previousIndex else {
            return nil
        }
        
        return pArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pArray.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let vcCount = pArray.count
        guard nextIndex < vcCount-1 else {return nil}
        guard nextIndex < vcCount else {return pArray.first}
        return pArray[nextIndex]
    }
    
}
