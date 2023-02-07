# MK-Albertsons-Assignemnt

* Cocoa pods is utilized for dependency management. 
* Alamofire for making API requests. Added as a dependency in Podfile
* Followed MVVM with Coordinator pattern. 

ViewController is designed in storyboard and has an ImageView with placeholder Image and Label with the text "Fact Loading ..."

NetworkRequesting.swift //This Class has methods to make API Requests.

    func makeRequestWithUrl<T:Decodable>(with url:String, completion: @escaping (Result<T, Error>) -> Void) //Makes API get request and decode the response.
    
    func downloadDataWithUrl(with url: String, completion: @escaping (Data?) -> Void) // Make API request and receive the data. Ideally used to download Iamges and Files.


MainCoordinator.swift //To handle the screen navigations and to invoke network methods and creates the ViewModel. 
 
     func start() //To start the coordinator. Pushes a view controller on to NavigationController
     
DispatchGroup's enter(), leave() and wait() methods are used to create the ViewModel once after two requests are complete. 
     Thread waits at the line wait() statement until all the enter() are fulfilled with leave() 
     
     enter() // Manually indicate a block has entered the group
     leave() // Manually indicate a block in the group has completed
     
     
FactResponse.swift // Has FactResponse object to decode the meowFacts Response

ViewModel.swift 
// Has ViewModel which represents the data required for UIViewcontroller's view display.




**Video Recording Demo**

https://user-images.githubusercontent.com/2981121/217324553-71f78435-c8d4-406a-86a3-38e61ec8c944.mov
