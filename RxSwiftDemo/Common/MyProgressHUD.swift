import SVProgressHUD

struct MyProgressHUD {
    
    static func baseConfigurated() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(UIColor(white: 0, alpha: 0.65))
        SVProgressHUD.setForegroundColor(UIColor.white)
    }
    
    static func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    static func show(with status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    static func showSuccess(with status: String) {
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    static func showError(with status: String) {
        SVProgressHUD.showError(withStatus: status)
    }
    
    static func showInfo(with status: String) {
        SVProgressHUD.showInfo(withStatus: status)
    }
    
    static func show(with status: String, dismissAfter: Double) {
        show(with: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissAfter) {
            self.dismiss()
        }
    }
    
    static func showSuccess(with status: String, dismissAfter: Double) {
        showSuccess(with: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissAfter) {
            self.dismiss()
        }
    }
    
    static func showError(with status: String, dismissAfter: Double) {
        showError(with: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissAfter) {
            self.dismiss()
        }
    }
    
    static func showInfo(with status: String, dismissAfter: Double) {
        showInfo(with: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissAfter) {
            self.dismiss()
        }
    }
}
