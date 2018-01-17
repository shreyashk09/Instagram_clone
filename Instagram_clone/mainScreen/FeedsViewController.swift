//
//  ViewController.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 08/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate {
    
    @IBOutlet weak var storyStackView: UIStackView!
    @IBOutlet weak var mainScroll: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScroll.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableViewConstraints()
        collectionViewConstraints()
        tableView.bounces = false
        mainScroll.bounces = false
        collectionView.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath)
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //let cell1 = tableView.cellForRow(at: indexPath)!
        print("\(indexPath)")
    }
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func tableViewConstraints(){
        let width = tableView.widthAnchor.constraint(equalToConstant: screenWidth)
        let height = tableView.heightAnchor.constraint(equalToConstant: screenHeight)
        tableView.addConstraints([height, width])
        tableView.updateConstraints()
    }
    func collectionViewConstraints(){
       // let width = collectionView.widthAnchor.constraint(equalToConstant: screenWidth)
        let height = collectionView.heightAnchor.constraint(equalToConstant: 150)
        collectionView.addConstraints([height])
        collectionView.updateConstraints()
    }
    
    //scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = mainScroll.contentOffset.y
        print("scrolling: \(yOffset)")
        if yOffset == 155 {
            mainScroll.isScrollEnabled = true
            tableView.isScrollEnabled = true
        }
        else if yOffset > 155 {
            mainScroll.isScrollEnabled = false
            tableView.isScrollEnabled = true
        }
        else {
            mainScroll.isScrollEnabled = true
            tableView.isScrollEnabled = false
        }
    }
}

