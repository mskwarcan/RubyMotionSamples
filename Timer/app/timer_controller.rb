class TimerController < UIViewController
  def viewDidLoad
    margin = 20
    
    # Creating a Label. Attributes are pretty straight forward.
    @state = UILabel.new
    @state.font = UIFont.systemFontOfSize(30)
    @state.text = 'Tap to start'
    @state.textAlignment = UITextAlignmentCenter
    @state.textColor = UIColor.whiteColor
    @state.backgroundColor = UIColor.clearColor
    #This sets the size of the label. [[x,y], [x,y]]. x is the x coordinate. y is the coordinate
    # the first set of coordinates set the top right corner and the second the bottom left corner
    @state.frame = [[margin, 150], [view.frame.size.width - margin * 2, 60]]
    # Adds the label to the view
    view.addSubview(@state)

    # Create a button with rounded corners, change the text based on the state of the button
    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Start', forState:UIControlStateNormal)
    @action.setTitle('Stop', forState:UIControlStateSelected)
    # Add an action for when button is clicked
    @action.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)
    @action.frame = [[margin, 260], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action)
  end

  def actionTapped
    #if timer is going, stop the time and remove the NSTimer
    if @timer
      @timer.invalidate
      @timer = nil
    else
      # start the timer at 0 and fire timerFired method every tenth of a second
      @duration = 0
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
    @action.selected = !@action.selected?
  end

  def timerFired
    #update the text of the label
    @state.text = "%.1f" % (@duration += 0.1)
  end
end
