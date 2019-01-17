import UIKit
import SnapKit
import Kingfisher

class GankViewCell: UITableViewCell {
    
    private lazy var picView: UIImageView = {
        let picView = UIImageView()
        picView.contentMode = .scaleAspectFit
        picView.clipsToBounds = true
        return picView
    }()
    
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .red
        return descLabel
    }()
    
    private lazy var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.textColor = .red
        return sourceLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupUI()
    }
    
    private func setupUI() {
        self.contentView.addSubview(picView)
        picView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.equalTo(200)
        }
        
        self.contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.picView.snp.right).offset(8)
            make.right.equalTo(self.contentView).offset(-15)
            make.top.equalTo(self.picView)
        }
        
        self.contentView.addSubview(sourceLabel)
        sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.picView.snp.right).offset(8)
            make.right.equalTo(self.contentView).offset(-15)
            make.bottom.equalTo(self.picView)
        }
    }
    
    func configureData(_ model: GankModel) {
        self.picView.kf.setImage(with: URL(string: model.url!))
        self.descLabel.text = "描述: \(model.desc ?? "")"
        self.sourceLabel.text = "来源: \(model.source ?? "")"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
