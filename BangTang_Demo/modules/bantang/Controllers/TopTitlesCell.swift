//
//  TopTitlesCell.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/7.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


class TopTitlesCell: UITableViewCell {

    
    var bgimageView:UIImageView?
    var titlelabel:UILabel?
    var favoriteBtn:UIButton?
    
    
    
    var dataModel:banTangModel?{
        
        didSet{
            let url = URL.init(string: (dataModel?.cover_image_url)!)
            self.bgimageView?.kf.setImage(with: url)
            self.titlelabel?.text = dataModel?.short_title
            self.favoriteBtn?.setTitle(String(dataModel!.likes_count!), for: .normal)
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUpUI(){
        
        let bgImageView : UIImageView = UIImageView.init()
        bgImageView.backgroundColor = UIColor.gray
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        self.contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            
            make.left.top.equalTo(10)
            make.bottom.right.equalTo(-10)
        }
        
        self.bgimageView = bgImageView
        
        
        
        let titlelabel : UILabel = UILabel.init()
        titlelabel.textColor = UIColor.white
        titlelabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titlelabel)
        titlelabel.snp.makeConstraints({ (make) in
            make.left.equalTo(bgImageView.snp.left).offset(10)
            make.right.equalTo(bgImageView.snp.right).offset(-10)
            make.bottom.equalTo(bgImageView.snp.bottom).offset(-10)
        })
        self.titlelabel = titlelabel
        
        
        let favoriteBtn : UIButton = UIButton.init()
        favoriteBtn.setImage(UIImage.init(named: "content-details_like_16x16_"), for: .normal)
        favoriteBtn.setTitleColor(UIColor.white, for: .normal)
        favoriteBtn.layer.cornerRadius = kCornerRadius
        favoriteBtn.layer.masksToBounds = false
        self.contentView.addSubview(favoriteBtn)
        favoriteBtn.snp.makeConstraints({ (make) in
            make.right.equalTo(bgImageView.snp.right).offset(-5)
            make.top.equalTo(bgImageView.snp.top).offset(5)
        })
        self.favoriteBtn = favoriteBtn
        
    }
    
    
    

}
