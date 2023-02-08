# MK-Albertsons-Assignment

This project display's the random Cat image along with a Fact. When user taps on screen then a new Image and Fact are fetched and are displayed. 

Below are the API's:

    To Fetch the Cat Image: http://placekitten.com/200/300 or: http://placekitten.com/g/200/300
    To Fetch the Cat Fact: https://meowfacts.herokuapp.com/

* Cocoa pods is utilized for dependency management. 
* Alamofire for making API requests. Added as a dependency in Podfile
* Followed MVVM with Coordinator pattern. 

ViewController is designed in storyboard and has an ImageView with placeholder Image and Label with the text "Fact Loading ..."

NetworkRequesting.swift //This Class has generic methods to make API Requests along with other request methods.

    func makeRequestWithUrl<T:Decodable>(with url:String, completion: @escaping (Result<T, Error>) -> Void) //Makes API get request and decode the response.
    
    func downloadDataWithUrl(with url: String, completion: @escaping (Data?) -> Void) // Make API request and receive the data. Ideally used to download Iamges and Files.


MainCoordinator.swift //Handles screen navigations, Make network requests and create the ViewModel. 
 
     func start() //Starts the coordinator. Pushes a view controller on to NavigationController.
     
DispatchGroup's enter(), leave() and wait() methods are utilized. ViewModel gets created once after two requests are complete. 
     Thread waits at the wait() statement until all the enter()'s are fulfilled with leave() 
     
     enter() // Manually indicate a block has entered the group
     leave() // Manually indicate a block in the group has completed
     
     
FactResponse.swift // Has FactResponse object to decode the meowFacts API Response.

ViewModel.swift // Has ViewModel which represents the data required to display UIViewcontroller's view.

Unit tests are in 

    ViewModelTests.swift
    ViewControllerTests.swift
    NetworkRequestTests.swift

Albertsons_AssignmentUITests.swift class has an UI Test.
     
     func testThatUIElementsPresent()

**Challenges Faced:**
By Default the applicaiton is not allowing http traffic for security reasons. So to retrieve data from the URl http://placekitten.com/200/300, added domain exceptions for "placekitten.com"

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>NSExceptionDomains</key>
        <dict>
            <key>placekitten.com</key>
            <dict>
                <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
                <true/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
        </dict>
    </dict>
    </plist>




**Video Recording Demo**

https://user-images.githubusercontent.com/2981121/217324553-71f78435-c8d4-406a-86a3-38e61ec8c944.mov
