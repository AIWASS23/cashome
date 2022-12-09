import UIKit

class TitleDateView: UIView {

    var delegate: TitleDateDelegate?

    var iconSelectDate: UIImageView = {
        let iconConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down", withConfiguration: iconConfiguration)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(named: "ActionColor")
        return imageView
    }()

    var monthText: UILabel = {
        let textView = UILabel()
        textView.text = ""
        textView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textView.textColor = UIColor.black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    lazy var monthSelectedStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(self.monthText)
        stackView.addArrangedSubview(self.iconSelectDate)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(monthSelectedStack)
        self.isUserInteractionEnabled = true
        setConstraints()
    }

    public func update() {
        monthText.text = delegate?.updateTitle()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        let monthSelectedStackConstraints = [
            monthSelectedStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            monthSelectedStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(monthSelectedStackConstraints)
    }
}
