import UIKit

class ProgressView: UIView {
        
    private var totalPoints: CGFloat = 295
    private var currentPoints: CGFloat = 0
    private var checkPointStart: CGFloat = 0
    
    var progressBarWidth: CGFloat = 0
    private var progressBarHeight: CGFloat = 5
    private var progressBarYPosition: CGFloat = 4
    private var checkPointHeight: CGFloat = 9

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        progressBarWidth = rect.width
        
        let totalProgressPath = UIBezierPath(roundedRect: CGRect(x: 0, y: progressBarYPosition, width: rect.width, height: progressBarHeight), cornerRadius: 2)
        UIColor.lightGray.setFill()
        totalProgressPath.fill()
        
        let currentProgressWidth = (currentPoints / totalPoints) * rect.width
        let currentProgressPath = UIBezierPath(roundedRect: CGRect(x: 0, y: progressBarYPosition, width: currentProgressWidth, height: progressBarHeight), cornerRadius: 2)
        UIColor.gearGreen!.setFill()
        currentProgressPath.fill()
        
        let checkpointStart = (currentPoints / totalPoints) * rect.width
        let checkpointStartPath = UIBezierPath(roundedRect: CGRect(x: checkpointStart, y: progressBarYPosition - checkPointHeight/4, width: checkPointHeight, height: checkPointHeight), cornerRadius: 2)
        UIColor.white.setFill()
        checkpointStartPath.fill()
//
//        let checkPointEnd = totalPoints
//        print(checkPointEnd)
//        let checkpointEndPath = UIBezierPath(roundedRect: CGRect(x: checkPointEnd, y: progressBarYPosition - checkPointHeight/4, width: checkPointHeight, height: checkPointHeight), cornerRadius: 1)
//        UIColor.white.setFill()
//        checkpointEndPath.fill()
    }
            
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 304, height: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
    }
}
