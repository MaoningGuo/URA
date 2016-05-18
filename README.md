Stock Simulations IOS (Swift)
==========================

This project is for simulating various methods in computational finance area. The project is an IOS application and the purpose of this project is to evaluate and compare different portfolio management methods in a portable way. 

Now the project supports two platforms, IOS and Android. This repository is for the IOS version for the research application. The project is built on a weather forecasting application demo for Swift. To understand how the application works, I recommend to read the original document for the weather forecasting application following by this session. 

###Features: 

* Validates stock symbols 
* Graphs the stock prices  
* Parameter view to enable simulation parameters
* Stores the list of portfolio simulations 
* Haves multiple simulations for one stock in the application
* Displays both graphs for stock prices and simulations for comparison

###User Guide: 

1.	Click on Add stock
2.	Put a legal stock symbol in the searching box
3.	Type parameters in
4.	View the stock simulations

###Technical Notes: 

API : The stock prices are pulled from https://www.quandl.com/blog/api-for-stock-data API. The application should show how this API works. Notice that the free tier for this API is very limited (50 times per day), may consider to change it to Yahoo API later. 

Graphing library: 
Here is the instructions for using the graph library
http://www.appcoda.com/ios-charts-api-tutorial/

Some classes to read: 
PocketForecast/Model/StockReport   -  Model for the stock report
PocketForecast/Client/WeatherClientBasicImpl.swift  Implementation for backend data
PocketForecast/UserInterface/Controllers/   UI implementations

###TO DO:

1.	I am not super familiar with IOS development. Please correct my implementation in a Swift or IOS way. 
2.	Catch the error if the stock symbol is not valid
3.	Store the graph and display the graph instead of calling API again
4.	Remove other unrelated weather stuff
5.	Perform the simulation parts






### Original Weather Doc



An example application built with <a href ="http://typhoonframework.org/">Typhoon</a>.

* Looking for an Objective-C sample application? We <a href="https://github.com/appsquickly/Typhoon-example">have one here</a>. 

###Features: 

* Returns weather reports from a remote cloud service
* Caches weather reports locally, for later off-line use. 
* Stores (creates, reads, updates deletes) the cities that the user is interested in receiving reports for. 
* Can use metric or imperial units. 
* Displays a different theme (background image, colors, etc) on each run. 


***NB: The free weather API that we were using no longer includes forecast information, so this won't be displayed in the app until we find an alternative. The concepts remain the same.***

###Running the sample:

* Clone this repository, open the Xcode project in your favorite IDE, and run it. It'll say you need an API key.
* Get an API key from https://developer.worldweatheronline.com/ 
* Using your API key, set the <a href="https://github.com/typhoon-framework/Typhoon-example/blob/master/PocketForecast/Assembly/Configuration.plist">application configuration</a>.
* Run the App in the simulator or on your device. Look up the weather in your town, and put a jacket on, if you need 
to (Ha!). Now, proceed to the exercises below. 

### Exercises

1. Study the <a href="https://github.com/typhoon-framework/Typhoon-Swift-Example/blob/master/PocketForecast/Assembly/CoreComponents.swift">core components</a>, 
<a href="https://github.com/typhoon-framework/Typhoon-Swift-Example/blob/master/PocketForecast/Assembly/ApplicationAssembly.swift">view controllers</a> and <a href="https://github.com/typhoon-framework/Typhoon-Swift-Example/blob/master/PocketForecast/Assembly/ThemeAssembly.swift">themes</a>. 
Notice how the framework allows you to group related components together. Notice how dependency injection allows for 
centralized configuration, at the same time as using aggressive memory management. (With default prototype-scope, components will go away 
whenever they're not being used). 
1. Study the <a href="https://github.com/typhoon-framework/Typhoon-Swift-Example/tree/master/PocketForecastTests/Integration">test cases</a>.
Imagine that you needed to use one service URL for integration tests and another for production. How would you do it?
1. Imagine that you decided to save the list of cities that the user wants to get reports for to iCloud, instead of 
locally on the device. Notice how you'd only need to change one line of code to supply your new implementation in 
place of the old one. And you'd be able to reuse the existing test cases. 
1. Imagine that you'd like to integrate with other weather data providers, and let the user choose at runtime. How would you do it? 
1. Try writing the same Application without dependency injection. What would the code look like? 



### The App 
![Weather Report](http://typhoonframework.org/images/portfolio/PocketForecast3.gif)
![Weather Report](http://typhoonframework.org/images/portfolio/pf-beach1.png)
![Weather Report](http://typhoonframework.org/images/portfolio/pf-lights1.png)

### I'm blown away!

Typhoon is a non-profit, community driven project. We only ask that if you've found it useful to star us on Github or send a tweet mentioning us (<a href="https://twitter.com/appsquickly">@appsquickly</a>). If you've written Typhoon related blog or tutorial, or published a new Typhoon powered app, we'd certainly be happy to hear about that too. 

Typhoon is sponsored and lead by <a href="http://appsquick.ly">AppsQuick.ly</a> with <a href="https://github.com/appsquickly/Typhoon/graphs/contributors">contributions from around the world</a>. 

***Thanks @hongcheng for the excellent <a href="https://github.com/honcheng/PaperFold-for-iOS">Paperfold</a> animation, and @michaeljbishop for the <a href="https://github.com/michaeljbishop/NGAParallaxMotion">parallax effect</a>. ***





