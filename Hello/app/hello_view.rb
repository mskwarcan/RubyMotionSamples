# Documentation for the UIView. http://bit.ly/dqOftn

class HelloView < UIView
  # drawRect: - Implement this method if your view draws custom content. 
  # If your view does not do any custom drawing, avoid overriding this method.
  def drawRect(rect)
    # Change the background color everytime they move
    if @moved
      bgcolor = begin
        red, green, blue = rand(100), rand(100), rand(100)
        UIColor.colorWithRed(red/100.0, green:green/100.0, blue:blue/100.0, alpha:1.0)
      end
      text = "ZOMG!"
    else
      # Reset the background color to black is screen is not being touched
      # and display the number of touches
      bgcolor = UIColor.blackColor
      text = @touches ? "Touched #{@touches} times!" : "Hello RubyMotion!"
    end
    
    # Set the background color
    bgcolor.set 
    
    #Creates and returns a new UIBezierPath object initialized with a rectangular path.
    UIBezierPath.bezierPathWithRect(frame).fill
  
    font = UIFont.systemFontOfSize(24)
    UIColor.whiteColor.set
    text.drawAtPoint(CGPoint.new(10, 20), withFont:font)
  end

  # touchesBegan:withEvent:, touchesMoved:withEvent:, touchesEnded:withEvent:, touchesCancelled:withEvent: - 
  # Implement these methods if you need to handle touch events directly.
  # setNeedsDisplay - Marks the receiver’s entire bounds rectangle as needing to be redrawn.

  # Tells the receiver when one or more fingers associated with an event move within a view or window.
  def touchesMoved(touches, withEvent:event)
    # if the screen is current being touched set moved to true
    @moved = true
    setNeedsDisplay  
  end

  #Tells the receiver when one or more fingers are raised from a view or window.
  def touchesEnded(touches, withEvent:event)
    # if the screen is current NOT being touched set moved to true and add 1 to the number of touches
    @moved = false
    @touches ||= 0
    @touches += 1
    setNeedsDisplay  
  end
end
