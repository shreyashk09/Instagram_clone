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
        let orderedViewControllersCount = pArray.count
        
        guard nextIndex < orderedViewControllersCount else {return pArray.last}
        guard orderedViewControllersCount > nextIndex else {return nil}
        return pArray[nextIndex]
    }
    /*func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = pArray.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pArray.index(of: pageContentViewController)!
    }*/
}
