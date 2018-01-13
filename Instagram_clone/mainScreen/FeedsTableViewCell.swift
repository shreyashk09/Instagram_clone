//
//  FeedsTableViewCell.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 09/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit
class FeedsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentsFeedView: UIStackView!
    @IBOutlet weak var prof_bar: UIView!
    @IBOutlet weak var feedImg: UIButton!
    @IBOutlet weak var writeComments: UIStackView!

    var timer = Timer()
    var isTimerOn: Bool = false
    var like: Bool = false
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
        doubleTap()
        comments()
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
            var newHeight: CGFloat = containerView.frame.height
            var newWidth: CGFloat = containerView.frame.width
            if containerView.frame.width > containerView.frame.height {
                newWidth = containerView.frame.height * ratio
            }
            else{
                 newHeight = containerView.frame.width / ratio
            }
            feedImg.frame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
            let image_Re = image.resizeImage(newWidth: newWidth,newHeight: newHeight)
            feedImg.setImage(image_Re, for: .normal)
            
            print("UIImageView and UIImage resized ")
        }
    }
    func doubleTap(){
        feedImg.addTarget(self, action: #selector(self.addLike), for: .touchUpInside)
    }
    @objc func addLike(sender: UIButton!){
        if(!isTimerOn){
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: false)
            isTimerOn = true
        }
        else{ if(!like) {
            like = true
            postLike()
        }
        else{ print("already liked")
            }}}
    @objc func updateTimer(){
        isTimerOn = false
        timer.invalidate()
    }
    func postLike(){print("post liked")}
    //comments view
    func comments(){
        dispComments()
        viewAllComments()
        writeComment()
    }
    func dispComments(){
     let  preComments = UILabel(frame: CGRect(x:0,y:0,width:screenWidth-12,height:30))
        preComments.text = "MR. Bean :" + "This is me...."+"\n"
        commentsFeedView.addArrangedSubview(preComments)
        print("pre comments added")
    }
    func viewAllComments(){
        let viewAllButton: UIButton = UIButton()
        viewAllButton.setTitle("view all 30 comments", for: .normal)
        viewAllButton.setTitleColor( UIColor.lightGray , for: .normal)
        viewAllButton.backgroundColor = UIColor.clear
        viewAllButton.titleLabel!.font = UIFont(name: "Helvetica Neue" , size: 12)
        viewAllButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 5.0, 0.0, 0.0)
        viewAllButton.contentHorizontalAlignment = .left
        viewAllButton.addTarget(self, action: #selector(self.allCommentsVC), for: .touchDown)
        commentsFeedView.addArrangedSubview(viewAllButton)
    }
    @objc func allCommentsVC(){
     print("all comments")
    }
    func writeComment(){
        let commentTextArea: UITextView = UITextView(frame: CGRect(x:0,y:0,width:screenWidth-30-12,height:30))
        commentTextArea.text = "comment Text"
        let pImage: UIImageView = UIImageView(frame: CGRect(x:0,y:0,width:20,height:20))
        pImage.image = UIImage(named: "prof2.jpeg")?.resizeImage(newWidth: 20,newHeight: 20)
        writeComments.addArrangedSubview(pImage)
        writeComments.addArrangedSubview(commentTextArea)
        commentsFeedView.addArrangedSubview(writeComments)
        print("write commentsubview added")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: screenWidth, height: 60)
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
        print("image resized")
        return newImage!
    } }
