import UIKit
import RxSwift
import RxCocoa
import MJRefresh

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let kGankCellIdentifier = "GankCellID"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.rowHeight = 240
        tableView.backgroundColor = .white
        tableView.register(GankViewCell.self, forCellReuseIdentifier: kGankCellIdentifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private let viewModel = GankViewModel(category: "福利")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        
        viewModel.gankList.asObservable().bind(to: self.tableView.rx.items) {(tableView, row, model) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "GankCellID") as! GankViewCell
            cell.configureData(model)
            return cell
        }.disposed(by: self.disposeBag)
        
        viewModel.refreshStatus.asObservable().subscribe(onNext: {[weak self] status in
            switch status {
            case .beingHeaderRefresh:
                self?.tableView.mj_header.beginRefreshing()
            case .endHeaderRefresh:
                self?.tableView.mj_header.endRefreshing()
            case .beingFooterRefresh:
                self?.tableView.mj_footer.beginRefreshing()
            case .endFooterRefresh:
                self?.tableView.mj_footer.endRefreshing()
            case .noMoreData:
                self?.tableView.mj_footer.endRefreshingWithNoMoreData()
            default:
                break
            }
        }).disposed(by: self.disposeBag)
        
        let refreshHeader = MJRefreshNormalHeader(refreshingBlock: {
            self.viewModel.requestCommond.onNext(true)
        })
        refreshHeader?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = refreshHeader
        
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.viewModel.requestCommond.onNext(false)
        })
        
        self.viewModel.requestCommond.onNext(true)
    }
}

