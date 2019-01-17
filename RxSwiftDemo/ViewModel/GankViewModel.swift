import UIKit
import RxSwift
import RxCocoa
import Moya_ObjectMapper

enum RefreshStatus {
    case none
    case beingHeaderRefresh
    case endHeaderRefresh
    case beingFooterRefresh
    case endFooterRefresh
    case noMoreData
}

class GankViewModel: NSObject {

    private(set) var gankList = Variable<[GankModel]>([])
    
    let requestCommond = PublishSubject<Bool>()
    
    let refreshStatus = Variable<RefreshStatus>(.none)
    
    var index = 1
    
    private var category: String
    
    private let disposeBag = DisposeBag()
    
    init(category: String) {
        self.category = category
        super.init()
        
        self.requestCommond.subscribe(onNext: { [unowned self] isRefresh in
           
            self.index = isRefresh ? 1 : self.index + 1
           
            GankProvider.rx.request(.gankList(category: self.category, size: 10, index: self.index))
                .mapObject(GankDataModel.self)
                //.map{ $0 }
                .asObservable()
                .subscribe({ event in
                    switch event {
                    case let .next(model):
                        self.gankList.value = isRefresh ? (model.results ?? []) : self.gankList.value + (model.results ?? [])
                    case let .error(err):
                        print(err.localizedDescription)
                        self.refreshStatus.value = isRefresh ? .endHeaderRefresh : .endFooterRefresh
                    case .completed:
                        self.refreshStatus.value = isRefresh ? .endHeaderRefresh : .endFooterRefresh
                    }
                }).disposed(by: self.disposeBag)
        }).disposed(by: self.disposeBag)
    }
}
