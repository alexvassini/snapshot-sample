import UIKit
import RxSwift
import RxCocoa

class FeedViewController: UIViewController {

    let viewModel: FeedViewModel
    let loadingView = LoadingView()

    weak var delegate: AppActionable?

    private var tableView: UITableView = {
        return UITableView()
    }()

    init(viewModel: FeedViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupBindings()
    }
    
}

extension FeedViewController {

    func configureViews() {

        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        self.navigationItem.title = "Feed"

        view.addSubview(tableView)
        view.addSubview(self.loadingView)
        tableView.prepareForConstraints()
        tableView.pinEdgesToSuperview()
        loadingView.prepareForConstraints()
        loadingView.pinEdgesToSuperview()
    }

    func setupBindings() {
        
        viewModel.isLoading.drive(onNext: { (isLoading) in
            self.loadingAnimation(isLoading)
        }).disposed(by: rx.disposeBag)

        self.viewModel.results
            .drive(tableView.rx
                .items(cellIdentifier: RepositoryTableViewCell.reuseIdentifier,
                       cellType: RepositoryTableViewCell.self)) { [unowned self] _ , item, cell in
                        cell.bindView(RepositoryTableViewCellViewModel(item: item))
                        if self.tableView.isNearBottomEdge(edgeOffset: 20) {
                            self.viewModel.requestTrigger.onNext(())
                        }
        }.disposed(by: rx.disposeBag)

        self.tableView.rx
            .modelSelected(GitRepository.self)
            .subscribe(onNext: { [unowned self ] (repo) in
                // self.delegate?.handle(.showDetails(repo))
            }).disposed(by: rx.disposeBag)

        self.viewModel.requestTrigger.onNext( () )

    }

    func loadingAnimation(_ isLoading: Bool){
        DispatchQueue.main.async {
            isLoading ? self.loadingView.show() : self.loadingView.hide()
        }
        
    }
    
}

extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
