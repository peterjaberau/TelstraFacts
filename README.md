# TelstraFacts
Test Application with special coding requirements

A single TableViewController application with the below specs:

1- Data from JSON (title, description, image)
2- Title in the navbar is updated from JSON
3- Each row have the right height to display its own content and no taller.
4- Not loading all the images all at once. Only as needed. NB: In the code I used a 3rd party library which I can avoid it by called the images using NSData
5- Pull down to refresh
6- screen not blocking the UI when loading the data from the json feed
7- Not using xib or storyboard
8- app can perform on low specification device such iphone 4
9- scrolling the table view is smooth including images
10- auto layout concept
11- NSUrlSession framework to call JSON

