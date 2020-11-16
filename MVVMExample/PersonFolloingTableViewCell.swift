//
//  PersonFolloingTableViewCell.swift
//  MVVMExample
//
//  Created by 김믿음 on 2020/11/16.
//

import UIKit

protocol PersonFolloingTableViewCellDelegate : AnyObject{
    func personfollowingTableViewCell(_ cell: PersonFolloingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel)
}

class PersonFolloingTableViewCell: UITableViewCell {
    static let identifier = "PersonFolloingTableViewCell"
    
    weak var delegate: PersonFolloingTableViewCellDelegate?
    
//    MARK: Properties
    
    private var viewModel : PersonFollowingTableViewCellViewModel?
    
    private let userImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()

    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        return button
    }()

//    MARK: init
    // Cell 의 contentView 안에 Addsubview 할수 있다..!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        userNameLabel.text = viewModel.userName
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else { return }
        
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        
        delegate?.personfollowingTableViewCell(self, didTapWith: newViewModel)
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: imageWidth,
                                     height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth+10,
                                 y: 0,
                                 width: contentView.frame.size.width-imageWidth,
                                 height: contentView.frame.size.height/2)
        userNameLabel.frame = CGRect(x: imageWidth+10,
                                     y: contentView.frame.size.height/2,
                                     width: contentView.frame.size.width-imageWidth,
                                     height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120,
                              y: 10,
                              width: 110,
                              height: contentView.frame.size.height-20)
    }
    
    // 버튼을 항상 리셋
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        userNameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
    
}
