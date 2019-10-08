import Foundation
import UIKit
import AlamofireImage

class RepositoryTableViewCell: UITableViewCell, Reusable {

    let avatarImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let ownerNameLabel: UILabel = {
          let lbl = UILabel()
          lbl.numberOfLines = 0
          lbl.textColor = UIColor(hexString: "#0366d6")
          lbl.font = UIFont.customFontDisplayBold(14)
          return lbl
      }()

    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor(hexString: "#0366d6")
        lbl.font = UIFont.customFontDisplayBold(20)
        return lbl
    }()

    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor(hexString: "#586069")
        lbl.font = UIFont.customFontTextRegular(14)
        return lbl
    }()

    let starsLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor(hexString: "#586069")
        lbl.font = UIFont.customFontTextRegular(14)
        return lbl
    }()

    // # MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(starsLabel)
        contentView.addSubview(ownerNameLabel)

        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // # MARK: Private Methods
    private func setupConstraints() {
        contentView.subviews.forEach{$0.prepareForConstraints()}

        nameLabel.pinTop(16)
        nameLabel.pinLeft(16)
        nameLabel.pinRight(8)

        descriptionLabel.pinTop(8, target: nameLabel)
        descriptionLabel.pinLeft(16)
        descriptionLabel.pinRight(16)

        starsLabel.pinTop(8, target: descriptionLabel)
        starsLabel.pinLeft(16)
        starsLabel.pinRight(16)

        avatarImageView.pinTop(8, target: starsLabel)
        avatarImageView.pinLeft(16)
        avatarImageView.constraintWidth(32)
        avatarImageView.constraintHeight(32)
        avatarImageView.pinBottom(8)

        ownerNameLabel.centerVerticallyinRelationTo(avatarImageView.centerYAnchor)
        ownerNameLabel.pinLeft(6, target: avatarImageView)
        ownerNameLabel.pinRight(8)

    }

    func bindView(_ model: RepositoryTableViewCellViewModel) {

        ownerNameLabel.text = model.getOwnerName()
        descriptionLabel.text = model.getDescription()
        nameLabel.text = model.getName()
        starsLabel.text = model.getStars()
        guard let url = model.getImage() else { return }
        avatarImageView.af_setImage(withURL: url)

    }

}
