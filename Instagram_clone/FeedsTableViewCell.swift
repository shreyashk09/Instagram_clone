//
//  FeedsTableViewCell.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 09/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit
class FeedsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var prof_bar: UIView!
    
    @IBOutlet weak var feedImg: UIImageView!
   
    @IBOutlet weak var fee_stackView: UIStackView!
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        profbar()
        feedimage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func profbar(){
        let btnSort: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.screenWidth)-Const.feedbar_opt_v, height: Const.feed_bar_top ))
        btnSort.setTitle("MR. BEAN", for: .normal)
        btnSort.setImage( UIImage(named: "prof2.jpeg")?.resizeImage(newWidth: 50,newHeight: 50), for: .normal)
        btnSort.setTitleColor(.black, for: .normal)
        //btnSort.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 25)
        btnSort.backgroundColor = UIColor.clear
        btnSort.titleEdgeInsets = UIEdgeInsetsMake(0.0, 5.0, 0.0, 0.0)
        btnSort.contentHorizontalAlignment = .left
        btnSort.addTarget(self, action: #selector(self.showSortTbl), for: UIControlEvents.touchUpInside)
        self.prof_bar.addSubview(btnSort)
    }
    
    @objc func showSortTbl() {
        print("open profile")
    }
    
    func feedimage(){
        let containerView = UIView(frame: CGRect(x:0,y:0,width:345,height:500))
        if let image = UIImage(named: "in2.jpeg") {
            let ratio = image.size.width / image.size.height
            if containerView.frame.width > containerView.frame.height {
                let newHeight = containerView.frame.width / ratio
                feedImg.frame.size = CGSize(width: containerView.frame.width, height: newHeight)
                feedImg.image = image.resizeImage(newWidth: containerView.frame.width,newHeight: newHeight)
               
            }
            else{
                let newWidth = containerView.frame.height * ratio
                feedImg.frame.size = CGSize(width: newWidth, height: containerView.frame.height)
                feedImg.image = image.resizeImage(newWidth: newWidth,newHeight: containerView.frame.height)
            }
            print(" width:\(feedImg.frame.width) height:\(feedImg.frame.height)")
        }
    }
}

extension UIImage {
    func resizeImage(newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    } }
