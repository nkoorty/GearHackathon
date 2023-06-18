import UIKit

class SlideUpPresentationController: UIPresentationController {
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView, let presentedView = presentedView else { return }
        
        containerView.addSubview(presentedView)
        presentedView.frame.origin.y = containerView.frame.height
        presentedView.layoutIfNeeded()
        
        coordinator?.animate(alongsideTransition: { _ in
            presentedView.frame.origin.y = 0
            presentedView.layoutIfNeeded()
        })
    }
}
