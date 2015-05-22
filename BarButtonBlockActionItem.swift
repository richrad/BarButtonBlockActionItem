import UIKit

class BarButtonBlockActionItem: UIBarButtonItem {
    
    private var blockAction: (() -> ())?

    override init() {
        super.init()
    }
    
    init(barButtonSystemItem systemItem: UIBarButtonSystemItem, blockAction block:(() -> ())?) {
        super.init(barButtonSystemItem: systemItem, target: nil, action: Selector("performBlockAction:"))
        self.target = self
        self.blockAction = block
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func performBlockAction(sender: AnyObject) {
        if let blockAction = blockAction {
            blockAction()
        }
    }
}
