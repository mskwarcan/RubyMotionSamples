# Create a UIViewController. Documentation can be found at http://bit.ly/w8j8YW
# The loadView will autmatically get called when it loads.

class HelloViewController < UIViewController
  def loadView
    # Sets the view to our hello_view.rb code
    self.view = HelloView.alloc.init
  end
end
