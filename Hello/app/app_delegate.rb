# This is where every app starts. 

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # Here we are assigning assigning an instance variable
    # We use an instance variable so this doesn't get garbage collected
    
    # Create a window that is the full size of the screen
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    # Set the root controller. This will be the hello_view_controller.rb file
    @window.rootViewController = HelloViewController.alloc.init
    
    # Set to Full Screen and make visible
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
