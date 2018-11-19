## Getting Started

Unbxd SDK implements support for making network calls to Unbxd platform and lets you easily configure and integrate Unbxd Site Search in your eCommerce application.

The following features are currently supported with Unbxd SDK.



<div class="table-docs">
<table>
<tr><th>Features</th><th>Description</th></tr>
<tr><td>Analytics</td><td>Track various visitor events on the e-commerce store such as product clicks, add to cart, orders, etc.</td></tr>
<tr><td>Unbxd Commerce Search</td><td>Interact with the Unbxd platform and implement all search related functionality with ease.</td></tr>
<tr><td>Autosuggest</td><td>For autocompletion of search queries and showcasing products relevant to query as you type.</td></tr>
<tr><td>Browse</td><td>Interact with the Unbxd platform and implement all category related functionality with ease. 
You can customize the experience on various pages -  Category, Brand, or any other attribute by leveraging various built-in features of Browse. 
</td></tr>
<tr><td>Recommendations</td><td>Integrate the Unbxd recommendations widgets that showcase personalised product suggestions to visitors on every page of your  e-commerce store.</td></tr>
</table>
</div>


### Prerequisites

Before you get started with the integration, you would need to:

* Set up your Unbxd account and obtain API key, Site key. These keys are generated at the time of account creation and can be accessed within Console at **Manage** -> **Configure Site** -> **Keys**.

* Upload your Product Feed. A product feed contains product-specific information of all the products, for example, title, price, category, color, description, availability and other product attributes. Unbxd product discovery algorithms work around your feed data, which must be uploaded in a particular format in order for us to relate to your products and their fields.

For more information on product feed, see [here](http://unbxd.com/documentation/site-search/v2-search-product-feed/).



### Dependency

**Alamofire** 4.7 or above - Alamofire is a Swift-based HTTP networking library for iOS and Mac OS X. 

**CocoaLumberjack** 3.4.1 or above - Logging framework.



### Supported platforms

Unbxd SDK is a dynamic framework programmed using Swift 4. This can be integrated with iOS applications with version 9.0 and above. The Framework is compatible with both Swift and Objective-C.



### Installation

Cocoapods is an application level dependency manager for Cocoa projects. It provides a standard format for managing external libraries. You can install it with the command below: 

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
$ gem install cocoa pods
```
</div>

To integrate `UnbxdSDK` into your Xcode project using Cocoapods, specify it in your Podfile:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
source ‘https://github.com/unbxd/iOS-SDK-Pod.git’
platform : ios, ‘9.0’
use_frameworks!

target ‘<your target name>’ do
pod ‘UnbxdSDK’
End
```
</div>


Run the command below:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
$ pod install
```
</div>


### Initialization

To begin, you will need to initialize the client. Import `UnbxdSDK` framework as shown below:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
import UnbxdSDK
```
</div>


`UnbxdSDK` is initialised with API key and Site key.


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let client = Client(siteKey: "<SITE-KEY>", apiKey: "<API-KEY>", logsConfig: LogsConfig)
```
</div>

`LogsConfig` - – Used to configure log level and provide folder path where log file to be
saved.
Example
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let logsFolderPath = "\(NSHomeDirectory())/Documents"
LogsConfig(logLevel: .verbose, folderPath: logsFolderPath)
```
</div>

All the SDK methods are invoked on shared instance of `UbClient`.

**IMPORTANT**: We advise you to use your API Key in encrypted form on your frontend and never share it with anyone.



## Unbxd Analytics

The actions a visitor takes on your e-commerce store are known as Events. Tracking visitor analytics and behaviour is essential in order to provide accurate and visitor-specific search and category page results and also help showcase how your business benefits from Unbxd through the reporting.

Unbxd Analytics tracks different events:

* Visitor
* Search Hit
* Category Page Hit
* Product Click
* Add to Cart
* Order
* Product Page View 
* Cart Removal
* AutoSuggest
* Recommendation Widget Impression
* Search Impression
* Category Page Impression
* Dwelltime (time spent on a product page)


For more information about different events, see [here](http://unbxd.com/documentation/site-search/v2-search-analytics-integration-rest-api/).

### Using UserId Method

SDK generates user id internally and using below method App can get UserId and visit type.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func userId() -> UserId
```
</div>

User Id instance would have,
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let id: String
let visitType: String
```
</div>

###Getting Request Id

RequestId should be passed to all the analytics api’s. It should be parsed from response header for key “Unbxd-Request-Id” from the request to Unbxd framework.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
extension HTTPURLResponse 
{
func unbxdRequestId() -> String? 
{
if let allHeaders = self.allHeaderFields as? 
[String: String] 
{
if let id = allHeaders["Unbxd-Request-Id"]
{
return id
}
}
return nil
}
}
```
</div>

### Using Analytics Method

**Analytics method signature**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func track(analyticsDetails:AnalyticsAbstract, completion: @escaping (_ response:
Dictionary<String, Any>?,_ httpResponse: HTTPURLResponse?, _ error:Error?) -> Void) {
// Handle response or request
}
```
</div>

For iOS applications, ViewController(type of class) acts as a page within the app. View controllers are identified by class names. define String constants in each viewcontroller and refer them in case of Analytics to track which page was viewed.
For example LoginViewController will have string constant say ‘Home Page’ so we post this string for page viewed event.


### Examples

Below are the events and argument each event would be accepting:

**Tracking Visitor Event:**:

Whenever a new user visits the app, a visitor event is fired, containing information about whether a user is a first time visitor or a repeat visitor.

This information is extracted from a 'visitor' cookie which is set every time the visitor event is fired. The cookie maintains the information about "visitType" parameter (also used by other events). Its value can be either 'first-time' or 'repeat'.

The SDK will generate a randomised unique identifier (UUID)- UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

Whenever a new user installs, launches and do some activity such as search, click etc.. on the application, a visitor event is fired from SDK, that contains information that shopper is a 'first-time' user.

Each session of the shopper on the application has an expiry time of 30 minutes and after it expires, the visitor event is fired again and reset the 'visitType' as "repeat" user. Next time the shopper opens the application, if the last visitor event was fired more than 30 minutes ago,  the visitor event is fired again with 'visitType' as "repeat" user. This means, that if the shopper is logged on to the application for more than 30 minutes, his/her visitType will be changed from 'first-time' to 'repeat' and will be "repeat" forever, until he uninstalls and re-installs the application.

All of the above mentioned tracking is done by the SDK itself and you as an application developer has to do nothing in order to track visitor event. 

**Tracking Search Event**:

A search event is fired when a shopper types something in the search box and presses enter or clicks on the search button. This will take the user to the search results page.

Example: 
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let searchAnalytics = SearchAnalytics(uid: userId.id, visitType: userId.visitType,
requestId: requestId, searchKey: "Shirt")

client.track(analyticsDetails: searchAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

here in this example "Shirt" is the string shopper types in the search box and presses enter or clicks on the search button.

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`query` : search query typed by shopper in case products listing page shows result of search event. "Shirt" in above example. 



**Tracking Category Page Event**:

Category Page event is fired when a user navigates through the categories on the online store and visits a category page.

Example:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let categoryQuery = CategoryNamePath(withCategories:["home"])

let categoryPageAnalytics = CategoryPageAnalytics(uid: userId.id, visitType: userId.visitType, requestId: requestId, categoryPages: categoryQuery, pageType:
PageType.CategoryPath)

client.track(analyticsDetails: categoryPageAnalytics, completion: {(response, httpResponse, err) -> Void in
//Handle response
})
```
</div>

here
`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`withCategories` : unique identifier for the page passed in the category page API as parameter ‘p’ in case of Category Page.
for instance, If you have integrated category pages using the API call: `http://search.unbxd.io/api-key/site-key/category?p=categoryName` then categoryQuery will be called as
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```
let categoryQuery = CategoryNamePath(withCategories:["categoryName"])
```
</div>

but if you have integrated category pages using the API call: `http://search.unbxd.io/api-key/site-key/category?p=category:categoryName`

then categoryQuery will be called as
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```
let categoryQuery = CategoryNamePath(withCategories: ["category:\(categoryName)"])
```
</div>

here
`pageType` : Its an enum defined in SDK. it accepts following values

1. URL
2. CATEGORY_PATH
3. TAXONOMY_NODE
4. ATTRIBUTE
5. BOOLEAN

`requestid`: The unbxd request id returned in the search/category page/recommendations api call response.

**Tracking Product Click Event**:

Whenever a user clicks on a particular product in the search or category page results, a 'click' action is generated.

The following code needs to be called along with the appended data as described below:

Example:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let productClickAnalytics = ProductClickAnalytics(uid: userId.id, visitType:
userId.visitType, requestId: requestId, pID: "2301609", query: "Socks", pageId:
"Order", boxType: "RECOMMENDED_FOR_YOU")

client.track(analyticsDetails: productClickAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

here
`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`query` : search query typed by shopper in case products listing page shows result of search event.

`pageId` : unique identifier for the page passed in the category page API as parameter ‘p’ in case of products listing page shows result of Category pages.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`boxType` : Recommendation widget clicked in case product is clicked from Recommendation Widget. 
Possible Values are 
<div class="table-docs">
<table>
<tr><th> Widget Type</th><th>Box Type</th></tr>
<tr><td> Recommended For You </td><td>RECOMMENDED_FOR_YOU</td></tr>
<tr><td> Recently Viewed </td><td>RECENTLY__VIEWED</td></tr>
<tr><td> More Like These </td><td>MORE_LIKE__THESE</td></tr>
<tr><td> Viewed also Viewed </td><td>ALSO__VIEWED</td></tr>
<tr><td> Bought also Bought </td><td> ALSO__BOUGHT</td></tr>
<tr><td> Cart Recommendations </td><td>CART__RECOMMEND</td></tr>
<tr><td> HomePage Top Sellers </td><td>TOP__SELLERS</td></tr>
<tr><td> Category Top Sellers </td><td>CATEGORY__TOP__SELLERS</td></tr>
<tr><td> PDP Top Sellers </td><td>PDP__TOP__SELLERS</td></tr>
<tr><td> Brand Top Sellers </td><td>BRAND__TOP__SELLERS</td></tr>
</table>
</div>


**Tracking Add to Cart Event**:

Whenever a user adds a product to his cart, a 'cart' action is generated.

Example:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let addToCartAnalytics = ProductAddToCartAnalytics(uid: userId.id, visitType: userId.visitType, requestId: requestId, productID: "2301609", variantId: "231221", quantity: 2)

client.track(analyticsDetails: addToCartAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

here

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`variantId` : Id of the variant being added. 

`quantity` : Quantity of the product added to the checkout bag.

`productID`: SKU id of the product.

**Tracking Order Event**:

An 'order' event will be fired after an order completion, when the user comes back to the product page from the payment gateway. If a user buys multiple products in a single order, then multiple order events should be fired.

Example:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let orderAnalytics = ProductOrderAnalytics(uid: userId.id, visitType: userId.visitType,
requestId: requestId, productID: "2301609", price: 20.5, quantity: 3)

client.track(analyticsDetails: orderAnalytics, completion: {(response:Any?,
error:Error?) -> Void in
//Handle response
})
```
</div>

here
`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`variantId` : Id of the variant being ordered. 

`quantity` : Quantity of the product ordered.

`productID`: SKU id of the product.

**Tracking Product Display Page Event:**:

Product Display Page View is fired when a user visits a Product Display Page

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let productDisplayPageAnalytics = ProductDisplayPageViewAnalytics(uid: userId.id,
visitType: userId.visitType, requestId: requestId, skuId: "2034")

client.track(analyticsDetails: productDisplayPageAnalytics, completion:
{(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`skuId`: SKU id of the product.

**Tracking Cart Removal Event**:

Cart Removal event is fired when a product in cart is removed.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let cartRemovalAnalytics = CartRemovalAnalytics(uid: userId.id, visitType:
userId.visitType, requestId: requestId, skuId: "2034", variantId: "231221", quantity:
2)

client.track(analyticsDetails: cartRemovalAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`variantId` : Id of the variant being removed. 

`quantity` : Quantity of the product removed.

`skuId`: SKU id of the product.

**Tracking AutoSuggest Event**:

An autosuggest event is fired when a user types something, then clicks on any of autosuggest results shown.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestAnalytics = AutoSuggestAnalytics(uid: userId.id, visitType:
userId.visitType, requestId: requestId, skuId: "2034", query: "Red Socks", docType:
"IN_FIELD", internalQuery: "red", fieldValue: "Red socks", fieldName: "infield1",
sourceField: "color type", unbxdPrank: 6)

client.track(analyticsDetails: autoSuggestAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

here

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`query` : Autosuggest suggestion returned by Unbxd.

`docType` : It can be `IN_FIELD`, `POPULAR_PRODUCTS` `TOP_SEARCH_QUERIES`, `KEYWORD_SUGGESTION`, `PROMOTED_SUGGESTIONS`.

`internalQuery` : Query for which autosuggest results were generated.

`fieldValue` : Set when `autosuggest_type` is `IN_FIELD`. Set to the value of the "in field" in unbxd response.It is set null otherwise.

`fieldName` : Set when `autosuggest_type` is `IN_FIELD`. Name of the autosuggest field in the search response.It is set to null otherwise.

`sourceField` : Name of the fields present in the catalogue on the combination of which in fields are generated.It is set when `autosuggest_type` is not null.

`skuId` : SKU id of the product.It is set non null when `autosuggest_type` is `POPULAR_PRODUCTS`.

`unbxdPrank` : unbxdPrank is the position of selected suggestion the list of items/suggestions received in Autosuggest response.

Skuid, query, doctype, internalQuery etc are obtained from Autosuggest response data.

**Tracking Recommendation Widget Impression Event**:

If you are subscribed to Unbxd Recommendations, every time the Recommendation widget is rendered, the recommendation widget event would be fired.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let recommendationImpressionAnalytics = RecommendationWidgetAnalytics(uid:
userId.id, visitType: userId.visitType, requestId: requestId, recommendationType:
RecommendationType.ViewerAlsoViewed, productIds: ["1692741-
1758","01692015-285","1692908-480"])

client.track(analyticsDetails: recommendationImpressionAnalytics, completion:
{(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

here

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

`recommendationType` : Specifies the type of recommendation widget. For different permissible values, refer the table below.
<div class="table-docs">
<table>
<tr><th> Widget Type</th><th>Box Type</th></tr>
<tr><td> Recommended For You </td><td>RECOMMENDED_FOR_YOU</td></tr>
<tr><td> Recently Viewed </td><td>RECENTLY__VIEWED</td></tr>
<tr><td> More Like These </td><td>MORE_LIKE__THESE</td></tr>
<tr><td> Viewed also Viewed </td><td>ALSO__VIEWED</td></tr>
<tr><td> Bought also Bought </td><td> ALSO__BOUGHT</td></tr>
<tr><td> Cart Recommendations </td><td>CART__RECOMMEND</td></tr>
<tr><td> HomePage Top Sellers </td><td>TOP__SELLERS</td></tr>
<tr><td> Category Top Sellers </td><td>CATEGORY__TOP__SELLERS</td></tr>
<tr><td> PDP Top Sellers </td><td>PDP__TOP__SELLERS</td></tr>
<tr><td> Brand Top Sellers </td><td>BRAND__TOP__SELLERS</td></tr>
</table>
</div>

`productIds` : List of product ids rendered. 

**Tracking Search Impression Event**:

A search impression event is fired when a search results page loads for the first time, and whenever results changes on applying pagination, autoscroll, sort, and filters. For each of these action, unique Ids of the products visible on search page should be sent as payload.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let searchImpressionAnalytics = SearchImpressionAnalytics(uid: userId.id, visitType: userId.visitType, requestId: requestId, query: "Shoes", productIds: ["1692741-
1758","01692015-285","1692908-480"])

client.track(analyticsDetails: searchImpressionAnalytics, completion:
{(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

here 
`action` : search_impression. 

`pids_list` : List of product ids of products visible in the window when the event occurs.

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`requestid` : The unbxd request id returned in the search/category page/recommendations api call response.

**Tracking Category Page Impression Event**:

A Category Page Impression event is fired when a category page results loads for the first time, and whenever the results changes on applying pagination, autoscroll, sort, and filters. For each of these action, unique Ids of the products visible on search page should be sent as payload.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let categoryPathQuery = CategoryNamePath.init(withCategories: ["men"])

let categoryPageImpression = CategoryPageImpressionAnalytics(uid: userId.id, visitType: userId.visitType, requestId: requestId, categoryPages:
categoryPathQuery, pageType: PageType.Url, productIds: ["1692741-
1758","01692015-285","1692908-
480"])

client.track(analyticsDetails: categoryPageImpression, completion:
{(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

here

`uid` : The SDK will generate a randomised unique identifier - UID to each unique user, who installs your application and it would be used to identify the user as first time visitor or a repeat visitor. This distinct ID is saved to device storage so that it will persist across sessions.

`visitType` : This information is extracted from a 'visitor' cookie setup by SDK.  Its value can be either 'first-time' or 'repeat'.

`withCategories` : unique identifier for the page passed in the category page API as parameter ‘p’ in case of Category Page.
for instance, If you have integrated category pages using the API call: http://search.unbxd.io/api-key/site-key/category?p=categoryName
then categoryQuery will be called as
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```
let categoryQuery = CategoryNamePath(withCategories:
["categoryName"])
```
</div>

but if you have integrated category pages using the API call: http://search.unbxd.io/api-key/site-key/category?p=category:categoryName

then categoryQuery will be called as
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```
let categoryQuery = CategoryNamePath(withCategories: ["category:\(categoryName)"])
```
</div>

`pageType` : Its an enum defined in SDK. it accepts following values

1. URL
2. CATEGORY_PATH
3. TAXONOMY_NODE
4. ATTRIBUTE
5. BOOLEAN

`requestid`: The unbxd request id returned in the search/category page/recommendations api call response.

`pids_list` : List of product ids of products visible in the window when the event occurs.

**Tracking Dwelltime Event**:

A dwelltime event is used to capture the amount of time spent on product description page in milliseconds.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let dwellTimeAnalytics = DwellTimeAnalytics(uid: userId.id, visitType:
userId.visitType, requestId: requestId, productID: "2301609", dwellTime: 60)

client.track(analyticsDetails: dwellTimeAnalytics, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

**Tracking Facet Event**:

A facet event is fired when a filter is applied on Search results or Category pages.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let facetAnalytics = FacetAnalytics(uid: userId.id, visitType: userId.visitType,
requestId: requestId, searchQuery: "Shirts", facetFields: NameFilter(field: "fit_fq",
value: "Fitted"))

client.track(analyticsDetails: facetAnalytics, completion: {(response:Any?,
error:Error?) -> Void in
//Handle response
})
```
</div>

here In this case, the value of "action" parameter would be "facets". "facets" would have all the selected facets. In case of Category Page, send “page” info instead of “query”.

## Unbxd Commerce Search

Unbxd Site Search is an e-commerce search platform that enhances your on-site search to deliver fast, relevant, and tailored search results to visitors on your website/mobile application. Unbxd Site Search is platform-agnostic, which makes it incredibly versatile and easily implementable. 

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-overview/).


### Using Search Methods

Search methods perform search with key and few other parameters. Search key is the mandatory argument and rest is applied for different criteria.

**Query method signature:**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
init(key: String, rows: Int? = nil, start: Int? = nil, format: ResponseFormat = .JSON, spellCheck: Bool = false, analytics: Bool = true, statsField: String? = nil, variant: Variant? = nil, fields:Array<String>? = nil, facet: Facet? = nil, filter: FilterAbstract? = nil, categoryFilter: CategoryFilterAbstract? = nil, multipleFilter: MultipleFilterAbstract? = nil, fieldsSortOrder: Array<FieldSortOrder>? = nil, personalization: Bool? = nill)
```
</div>

**Search method signature:**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func search(query:SearchQuery, completion: @escaping (_ response: Dictionary<String, Any>?,_ httpResponse: HTTPURLResponse?, _ error:Error?) -> Void) {
// Handle response or request
}
```
</div>

* Keywords marked in bold are different arguments for search method.
* ‘query’ of type ‘SearchQuery’ is mandatory argument and rest are optional which are used as needed.

`SearchQuery` consists of `searchKey` parameter with few other parameters. 
Lets see how these arguments can be composed and passed in search() method invocation.

**Search Query:**

SearchQuery consists of searchKey parameter with other parameters. Invoking Search method with key

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt")

client.search(query: query, completion:{ (response, httpResponse, err) -> Void in
//Handle response
})
```
</div>

**Format**

The format parameter specifies the format of the response. Possible values are ‘json’ or ‘xml’. It is an optional parameter and the default value is ‘json’.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", format: .XML)

client.search(query: query, completion:{(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Start**

The start parameter is used to offset the results by a specific number. It indicates offset in the complete result set of the products. It is an optional parameter and the default value is 0.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", start: 2, format: .JSON)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Rows**

The rows parameter is used to paginate the results of a query. It indicates number of products in a single page. It is an optional parameter and the default value is 10, maximum value is 100.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", rows: 20)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Spellcheck**

The spellcheck feature provides spelling suggestions or spell-check for misspelled search queries.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", spellCheck: true)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Analytics**

The analytics parameter enables or disables tracking the query hit for analytics. By default, tracking is enabled.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", analytics: false)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Stats**

The stats parameter gives information about the products with highest and
lowest field value.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", statsField: "price")

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Variants**

Products in the feed can be available in different sizes, colors, styles, materials, etc. For example, a dress can be available in different sizes, colors and/or styles.
Variant 1 : Color - Blue, Size: Small, Style - Solid print
Variant 2 : Color - Red, Size: Small, Style - Solid print
Variant 3 : Color - Blue, Size: Large, Style - Polka-dot
Variants parameter enables or disables variants in the API response. It can take two values: “true” or “false”. Default value is “false”.


For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/#unbxdsearchapiformat) (Request Parameters section).


### Examples

Example schema for variants:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
{
"feed": {
"catalog": {
"schema": [{
"fieldName": "vColor",
"id": "76678",
"dataType": "text",
"multiValue": "true",
"autoSuggest": "false",
"isVariant": "true"
}, {
"fieldName": "vSize",
"dataType": "text",
"multiValue": "true",
"autoSuggest": "false",
"isVariant": "true"
}, {
"fieldName": "vImages",
"dataType": "link",
"multiValue": "true",
"autoSuggest": "false",
"isVariant": "true"
}, {
"fieldName": "vPrice",
"dataType": "decimal",
"multiValue": "true",
"autoSuggest": "false",
"isVariant": "true"
}]
}
}
}
```
</div>


**Example: Search with variants**

Variants parameter enables or disables variants in the API response. It can take two values: “true” or “false”. Default value is “false”.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", variant: Variant(has: true, count: 2))
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


If you want to get more than one variants in the API response, you can use `variantCount` parameter. It can have any numerical value (for example,1,2,3,etc) or “.max” (to get all the variants).


**Fields**

The fields parameter is used to specify the set of fields to be returned as the response, otherwise all the fields will be returned in the response by default.

Fore more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/#unbxdsearchapiformat) (Request Parameters section).


**Example: Search with selected fields**

The fields parameter is used to specify the set of fields to be returned. When returning the results, only fields in the list will be included.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", fields: ["title","vPrice"])

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>


**Facets**

Facets are filters in the UI that allow visitors to narrow down result set based on product fields. It is usually known as Layered Navigation or Guided Navigation. 
Facets can be easily configured from the **Manage** -> **Configure Search** -> **Configure Facet** section of the Console.


Facets can be of three types: 

* **Multi-level**: Facets on categories. For a given API response, multi-level facets would represent the top-most categories those products lie under.
* **Text**: Facets on text fields in the feed. For example, color, brand, etc. 
* **Range**: Facets on numeric fields in the feed. For example, price, discount, etc.

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/#unbxdsearchapiformat) (Request Parameters section).


**Example: Search with multi-level facets**

The facer multilevel parameter is used to enable multi-level facets in the API response.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", facet: .MultiLevel)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>


**Example: Search with multi-select facets**

This feature enables or disables the option to select multiple values within a facet or across facets for visitors. 
For example, for a query “red dress”, facets on gender and size fields are displayed. If the value for facet.multiselect is set as true and if a visitor selects Women in the Gender facet, the search results will be refined according to the selection. However, all values in the gender facet will still be sent in the response as if the gender filter isn’t applied (and other filters are applied, if any).


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", facet: .MultiSelect)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Example: Search with selected facet with field ID and value ID**

This feature enables or disables the option to select multiple values within a facet or across facets for visitors.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", facet: .MultiSelect)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Example: Search with selected facet with field name and value name**

The selected facet parameter enables or disables the Selected Facets in the API response.

Selected facet with field id and value id:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", facet: .Selected(IdFilter(field: "76678", value: "5001")))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

Selected facet with field name and value name:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: “Shirt", facet: .Selected(NameFilter(field:
"Brand_uFilter", value: "Vince Camuto")))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Filtering**

Filter is used to restrict the products based on criteria passed. Three types of filters are supported:

* **Text**: It is used to filter products based on fields with string values such as color, gender, brand, etc. It can be defined in the API call in two ways:

`Using Field Ids`:

`IdFilter can be formed with 2 parameters.`

`field`: The id of the field on which the text filter is applied.

`value`: The id of the value on which the results are filtered.

Example:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", filter: IdFilter(field: "76678", value: "5001"))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

`Using Field Names`:

`Again NameFilter can be formed with 2 parameters.`

`type`: The id of the field on which the text filter is applied.

`value`: The id of the value on which the results are filtered.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", filter: NameFilter(field: "vColor_uFilter",
value: "Black"))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>


* **Range**: It is used to filter products based on fields with data types - date, number or decimal. . It can be defined in the API in two ways:

`Using Field Names`:

`Filter Range of type id is built using IdFilterRange class and it can be initialised with below parameters.`

`field` : The id of the field on which the text filter is applied.
`lower` : The id of the lower limit of the range.
`upper` : The id of the upper limit of the range.

Example
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", filter: IdFilterRange(field:"76678", lower:
"2034", upper: "8906"))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

`Using Field Name`:

`Filter Range of type name is built using NameFilterRange class and it can be initialised with below parameters.`

`field` : The name of the field on which the text filter is applied.
`lower` : The name of the lower limit of the range.
`upper` : The name of the upper limit of the range.

Example
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", filter: NameFilterRange(field: "vColor", lower:
"red", upper: "blue"))

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

* **Multilevel**: It is used to filter products based on categories

Each of the three filters can filter on field-name and field-id. Field-id/field-name is an optional parameter. If passed, it eliminates those products that do not match the criteria. 

**Note**: If IDs are present in the feed, filtering should be done on IDs only. 

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/) (Request Parameters section).

The multilevel filter is used to filter products based on categories. It can be defined in the API call in two ways:

`Using Field Ids`:

`“CategoryIdFilter” is used to filter the results using category path comprised of category IDs.`

Example
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let categoryIdFilter = CategoryIdFilter()
categoryIdFilter.categories.append("FA")
categoryIdFilter.categories.append("A0485")

let query = SearchQuery(key: "Shirt", categoryFilter: categoryIdFilter)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

`Using Field Names`:

`“CategoryNameFilter” is used to filter the results using category path comprised of category Names.`

Example
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let categoryNameFilter = CategoryNameFilter()
categoryNameFilter.categories.append("Fashion")
categoryNameFilter.categories.append("Shirts")

let query = SearchQuery(key: "Shirt", categoryFilter: categoryNameFilter)

client.search(query: query, completion: {(response, httpResponse, err)-> Void in
//Handle response
})
```
</div>

**Search with Multiple filters using field ID/field name**:

Multiple Filters: Multiple facets can be selected, which applies corresponding filters in a single call. There are two types of filter operations: 

* AND
* OR


**Search with multiple filters using AND and field ID/field name:**

`MultipleIdFilter` takes two parameters, fieldType Id and fieldValue id. 

`MultipleNameFilter` takes two parameters, fieldType name and fieldValue name.

Multiple filters can be added and `operatorType` is set to 'AND'.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let multipleIdFilter = MultipleIdFilter.init() multipleIdFilter.operatorType = .AND multipleIdFilter.filters.append(IdFilter.init(withFieldType: "76678", fieldValue: "5001")) multipleIdFilter.filters.append(IdFilter.init(withFieldType: "76678", fieldValue: “5021")) client?.searchWithQuery(query: searchQuery, multipleFilter: multipleIdFilter, completion: {(response:Any?, error:Error?) -> Void in 
//Handle response 
})

OR

//Using field name
let multipleNameFilter = MultipleNameFilter.init() multipleNameFilter.operatorType = .AND multipleNameFilter.filters.append(NameFilter.init(withFieldType: "vColor_uFilter", fieldValue: "Black")) multipleNameFilter.filters.append(NameFilter.init(withFieldType: "vColor_uFilter", fieldValue: “White")) 
client?.searchWithQuery(query: searchQuery, multipleFilter: multipleNameFilter, completion: {(response:Any?, error:Error?) -> Void in 
//Handle response 
})
```
</div>


**Search with multiple filters using OR and field ID/field name**:

`MultipleIdFilter` takes two parameters, fieldType Id and fieldValue id. 

`MultipleNameFilter` takes two parameters, fieldType name and fieldValue name.

Multiple filters can be added and `operatorType` is set to ‘OR’.


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let multipleIdFilter = MultipleIdFilter()
multipleIdFilter.operatorType = .OR
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5001"))
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5021"))
let query = SearchQuery(key: "Shirt", multipleFilter: multipleIdFilter)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})    

OR

//Using field name
let multipleNameFilter = MultipleNameFilter()
multipleNameFilter.operatorType = .OR
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "Black"))
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "White"))
let query = SearchQuery(key: "Shirt", multipleFilter: multipleIdFilter)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>



**Sorting**

The sort parameter is used to rank the products based on specified fields in the specified order. You can sort on a single field or on multiple fields.

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/) (Request Parameters section).


**Search with sorting on single field/multiple fields**

`fieldName`: The field on which the sort is applied.

`sortOrder`: The order in which the sort is applied. This value can be "ASC" (for ascending) or "DSC" (for descending)


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//single field
var fieldsWithOrder = Array<FieldSortOrder>()
fieldsWithOrder.append(FieldSortOrder(field: "price", order: .ASC))        
let query = SearchQuery(key: "Shirt", fieldsSortOrder: fieldsWithOrder)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})

OR

//multiple fields hence 2 or more FieldSortOrder instances are added
var fieldsWithOrder = Array<FieldSortOrder>()
fieldsWithOrder.append(FieldSortOrder(field: "price", order: .ASC))
fieldsWithOrder.append(FieldSortOrder(field: "title", order: .DSC)) 
let query = SearchQuery(key: "Shirt", fieldsSortOrder: fieldsWithOrder)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Spellcheck**

The spellcheck feature provides spelling suggestions or spell-check for misspelled search queries. In such cases, the context-aware algorithm of Unbxd understands your visitor’s intent and sends a “Did You Mean” response along with search result set for the query, if any.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let query = SearchQuery(key: "Shirt", spellCheck: true)
client.search(query: query, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-rest-api/) (Request Parameters section).





## Unbxd Autosuggest

The Autosuggest feature provides query suggestions, which helps your visitors to search faster in your site. Unbxd supports autocompletion of search queries and showcasing products relevant to query as they type.

Unbxd Autosuggest comprises of different types of suggestions that are known as **doctypes**. A standard Unbxd Autosuggest is segmented into five doctypes:

<div class="table-docs">
<table>
<tr><th>Features</th><th>Description</th></tr>
<tr><td>In-fields</td><td>The In-fields doctype suggest groups of relevant products along with their associated field values the query may belong to. 
<br>
These field values can be categories, brands, occasion, etc. For example, a visitor types ‘Sh’, the In-field doctype will have the following suggestions:
<ul>
<li>Shirts
<ul>
<li>In Men (based on gender)</li>
<li>In Nike, (based on brand)</li>
<li>In Blue (based on occasion)</li>
</ul>
</li>
</ul>  
</td></tr>
<tr><td>Keyword Suggestions</td><td>These are intelligent suggestions generated by Unbxd based on the query being typed and suggests relevant products based on your product feed accordingly. 
<br>
For example, a visitor types ‘Sh’, the keyword suggestions doctype will have the following suggestions:
<ul>
<li>Shirts</li>
<li>Shorts</li>
<li>Shoes</li>
<li>Shapewear</li>
</ul>
</td></tr>
<tr><td>Top Queries</td><td>This doctype displays the frequently searched queries in your e-commerce store populated with the help of Unbxd Analytics, which keeps a track of your store.</td></tr>
<tr><td>Popular Products</td><td>This doctype displays popular products with thumbnail images. Similar to Top Queries doctype, to render Popular products, Unbxd analytics needs to be integrated in your e-commerce store.</td></tr>
<tr><td>Promoted Suggestions</td><td>These are documents that a customer can configure directly from merchandising console. 
<br>
For example, if a customer configures “jogging shoes” and “running shoes” as promoted suggestions, and a shopper searches for “sh”, the intended results are returned.
</td></tr>
</table>
</div>

For more information, see [here](http://unbxd.com/documentation/site-search/v2-search-overview/#unbxdautosuggest) (Request Parameters section).


### Using Autosuggest Methods

**Autosuggest method signature:**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func search(query:SearchQuery, completion: @escaping (_ response:Any?,_ error:Error?) -> Void) {
// Handle response    
}
```
</div>

Query of type `AutoSuggestQuery` is mandatory and rest of the arguments are optional. 
Below are few sample of invoking `autoSuggestWithQuery()` method with different arguments.

**Query method signature:**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
init(withKey:String, format: ResponseFormat = .JSON, inField: DocTypeInField? = nil, keywordSuggestions: DocTypeKeywordSuggestions? = nil, topQueries: DocTypeTopQueries? = nil, promotedSuggestions: DocTypePromotedSuggestions? = nil, popularProducts: DocTypePopularProducts? = nil, variant: Variant? = nil, filter: FilterAbstract? = nil)
```
</div>

**Autosuggest method invocation**:

`AutoSuggestQuery` can be initialised with 'Key' for suggestions are expected.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir")
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


### Examples
**Example: Autosuggest Query:**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir")
client.autoSuggest(query: autoSuggestQuery, completion: {(response,
httpResponse, err) -> Void in
//Handle response
})
```
</div>

**Example: Autosuggest with Variants**:

As in Unbxd Commerce Search, you can show variants in Autosuggest too. 
Variants can be enabled or disabled in AutoSuggest query response. Variant Status can be set to true/false as shown below.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", variant:Variant(has: true))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?,error:Error?) -> Void in
//Handle response
})
```
</div>


**Autosuggest with various doctypes**:

If `resultsCount` is not set, default value 2 will be considered

**1. In Fields**

The query being typed by your visitor can belong to multiple product categories based on your product feed. The In-fields doctype in Autosuggest suggest groups of relevant products along with their associated field values the query may belong to.

In Field doctype with result count can be configured as shown below:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeInField(resultsCount: 3))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div> 

If resultsCount is not set, default value 2 will be considers as results count for In Field doctype.

**2. Keyword Suggestions**  

These are intelligent suggestions generated by Unbxd cloud servers whose algorithm identifies the keywords from the query being typed and suggests relevant products based on your product feed accordingly. 

Keyword Suggestions doctype with result count can be configured as shown below:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeKeywordSuggestions(resultsCount: 4))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

If resultsCount is not set, default value 2 will be considers as results count for Keyword Suggestions doctype.

**3. Top Queries** 

As the name suggests, this autosuggest doctype displays the frequently searched queries in your ecommerce store. These top queries are populated with the help of Unbxd Analytics which keeps a track of your store.

Top Queries doctype with result count can be configured as shown below:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeTopQueries(resultsCount: 3))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

If resultsCount is not set, default value 2 will be considers as results count for Top Queries doctype.

**4. Promoted Suggestions**

Promoted Suggestions are documents that a customer can configure directly from merchandising console. This gives you the flexibility to manually insert keyword suggestions in autosuggest which may not be part of the default relevance results.

Promoted Suggestions doctype with result count can be configured as shown below:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypePromotedSuggestions(resultsCount: 5))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

If resultsCount is not set, default value 2 will be considers as results count for Promoted Suggestions doctype.

**5. Popular Products**

The Popular Products doctype displays popular product in your e-commerce store with thumbnail images. 

Popular Products doctype with fields and result count can be configured as shown below:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypePopularProducts(resultsCount: 3, fields: ["vColor","price"]))
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div> 

If resultsCount is not set, default value 3 will be considers as results count for Promoted Suggestions doctype.

**Autosuggest with Filters:**

Filters are used in AutoSuggest method to restrict the products based on criteria passed.

Two types of filters are supported in autoSuggestWithQuery() method:

* **Text**: It is used to filter products based on fields with string values such as color, gender, brand, etc

* **Range**: It is used to filter products based on fields with data types - date, number or decimal

Each of these filters can filter on field-name and field-id. Field-id/field-name is an optional parameter. If passed, it eliminates those products that do not match the criteria. 
**Note**: If IDs are present in the feed, filtering should be done on IDs only. 


**Autosuggest with text filter using field ID/field name:**

“filter-id” is used to filter the results using field-id. Using Field IDs, ‘IdFilter’  can be formed with two parameters:

1. `fieldID`: The id of the field on which the text filter is applied.
2. `field`: The id of the value on which the results are filtered.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using Field ID
let idFilter = IdFilter(field: "76678", value: "5001")
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeKeywordSuggestions(resultsCount: 4), filter: idFilter)
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})

OR

//Using Field Name
let nameFilter = NameFilter(field: "vColor_uFilter", value: "Black")
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeKeywordSuggestions(resultsCount: 4), filter: nameFilter)
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Autosuggest with Range filter using field ID/field name:**

“filter-id” is used to filter the results using field-id. Using Field IDs, ‘IdFilter’  can be formed with two parameters:

1.`fieldID`: The id of the field on which the text filter is applied.
2.`field`: The id of the value on which the results are filtered.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using Field ID
let idRange = IdFilterRange(field: "76678", lower: "2034", upper: "8906")
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeKeywordSuggestions(resultsCount: 4), filter: idRange)
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})


OR

//Using Field Name
let nameRange = NameFilterRange(field: "vColor", lower: "red", upper: "blue")
let autoSuggestQuery = AutoSuggestQuery(withKey: "Shir", docType: DocTypeKeywordSuggestions(resultsCount: 4), filter: nameRange)
client.autoSuggest(query: autoSuggestQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

## Unbxd Browse

The SDK lets you customize your page experience by leveraging various built-in features of Browse. You can also power any type of page, such as Category, Brand, or any other attribute.


### Using Browse Method

Browse methods operates on Category fields query which is configured part of Browse Query.

**Query method signature:**:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
init(categoryQuery: CategoryAbstract, rows: Int? = nil,  start: Int? = nil, format: ResponseFormat = .JSON, spellCheck: Bool = false, analytics: Bool = false, statsField: String? = nil, variant: Variant? = nil, fields:Array<String>? = nil, facet: Facet = .None, filter: FilterAbstract? = nil, categoryFilter: CategoryFilterAbstract? = nil, multipleFilter: MultipleFilterAbstract? = nil, fieldsSortOrder: Array<FieldSortOrder>? = nil)
```
</div>


**Browse method signature:**:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func browse(query:BrowseQuery, completion: @escaping (_ response:Any?,_ error:Error?) -> Void)
```
</div>

### Examples

**Browse with Page name/ Page ID**

BrowseQuery consists of Category path or field details parameter and few other optional parameters.

* It is mandatory to pass either page name or page ID. If both are passed together, page name would be ignored and results would be shown as per page ID.
* The value passed under page ID(or page name) is displayed in the Unbxd Console and analytics reports as-it-is.


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//With Page name
let categoryQuery = CategoryIdPath(withCategories:                             ["Fashion","Shoes","Sneakers","Athletic shoes"])
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})

OR

//With Page ID                        
let categoryQuery = CategoryIdPath(withCategories: [“FA”,"FA0484"])
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})

OR

//With Field ID    
let categoryQuery = CategoryIdPath(withCategories: ["FA","FA0484"])
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})

OR

//With Field name
let categoryQuery = CategoryNameFields(field: "vColor", value:     “Black")
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>



**Example: Browse with variants**
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
, variant: Variant(has: true, count: 2))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
})
```
</div>

If you want to get more than one variants in the API response, you can use `Count` parameter. It can have any numerical value (for example,1,2,3,etc) or “.max” (to get all the variants).


**Fields**

The fields parameter is used to specify the set of fields to be returned as the response, otherwise all the fields will be returned in the response by default.

Fore more information, see <a style="margin-top:0px" class="unbxd-know-more" target="_blank" href=" http://unbxd.com/documentation/site-search/v2-browse-rest-api/">here</a> (Request Parameters section).


**Example: Browse with selected fields**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
, fields: ["title","vPrice"])
client.browse(query: browseQuery,, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Facets**

Facets are the filters in the UI that allow visitors to narrow down result set based on product fields. It is usually known as Layered Navigation or Guided Navigation. 
Facets can be easily configured from the **Manage** -> **Configure Browse** -> **Configure Facet** section of the Console.


Facets can be of three types: 

* **Multi-level**: Facets on categories. For a given API response, multi-level facets would represent the top-most categories those products lie under.
* **Text**: Facets on text fields in the feed. For example, color, brand, etc. 
* **Range**: Facets on numeric fields in the feed. For example, price, discount, etc.

For more information, see <a style="margin-top:0px" class="unbxd-know-more" target="_blank" href=" http://unbxd.com/documentation/site-search/v2-browse-rest-api/">here</a> (Request Parameters section).


**Example: Browse with multi-level facets**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
, facet: .MultiLevel)
client.browse(query: browseQuery,, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Example: Browse with multi-select facets**

This feature enables or disables the option to select multiple values within a facet or across facets for visitors.

For example, for a query “red dress”, facets on gender and size fields are displayed. If the value for facet.multiselect is set as true and if a visitor selects Women in the Gender facet, the Browse results will be refined according to the selection. However, all values in the gender facet will still be sent in the response as if the gender filter isn’t applied (and other filters are applied, if any).

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
, facet: .MultiSelect)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Example: Browse with selected facet with field ID and value ID**

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//With Field ID, Value ID
let browseQuery = BrowseQuery(categoryQuery: categoryQuery),                     facet: .Selected(IdFilter(field: "76678", value: "5001")))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
})

OR

//With Field Name, Value Name
let browseQuery = BrowseQuery(categoryQuery: categoryQuery),                     facet: .Selected(NameFilter(field: "Brand_uFilter", value: "Vince Camuto")))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
})
```
</div>


**Filtering**

Filter is used to restrict the products based on criteria passed. Three types of filters are supported:

* **Text**: It is used to filter products based on fields with string values such as color, gender, brand, etc.
* **Range**: It is used to filter products based on fields with data types - date, number or decimal.
* **Multilevel**: It is used to filter products based on categories.

Each of the three filters can filter on field-name and field-id. Field-id/field-name is an optional parameter. If passed, it eliminates those products that do not match the criteria. 

**Note**: If IDs are present in the feed, filtering should be done on IDs only. 

For more information, see <a style="margin-top:0px" class="unbxd-know-more" target="_blank" href=" http://unbxd.com/documentation/site-search/v2-browse-rest-api/">here</a> (Request Parameters section).


**Browse with text filter using field ID/field name:**:

“filter-id” is used to filter the results using field-id.  Using Field IDs, ‘IdFilter’  can be formed with two parameters:

* `Field`: The id/name of the field on which the text filter is applied.
* `Value`: The id/name of the value on which the results are filtered.


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), filter:                 IdFilter(field: "76678", value: "5001"))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
})

OR

//Using field name
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), filter:                 NameFilter(field: "vColor_uFilter", value: "Black"))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Browse with Range filter using field ID/field name**

Range filter is built using `FilterIdRange` class and it can be initialised with parameters below.

* `field`: The id/name of the field on which the text filter is applied.
* `lower`: The id of the lower limit of the range. 
* `upper`: The id of the upper limit of the range.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), filter:                 IdFilterRange(field: "76678", lower: "2034", upper: "8906"))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})


OR

//Using field name
let query = SearchQuery(key: "Shirt", filter: NameFilterRange(field: "vColor", lower:         "red", upper: "blue"))
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Browse with Multi-level filter using field ID/field name:**:

`CategoryIdFilter` is used to filter the results using category path comprised of category IDs.

`CategoryNameFilter` is used to filter the results using category path comprised of category Names.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let categoryIdFilter = CategoryIdFilter()
categoryIdFilter.categories.append("FA")
categoryIdFilter.categories.append("A0485")
let browseQuery = BrowseQuery(categoryQuery: categoryQuery),                     categoryFilter: categoryIdFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
})

OR

//Using field name
let categoryNameFilter = CategoryNameFilter()
categoryNameFilter.categories.append("Fashion")            categoryNameFilter.categories.append("Shirts")
let browseQuery = BrowseQuery(categoryQuery: categoryQuery),                     categoryFilter: categoryNameFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) ->             Void in
//Handle response
}) 
```
</div>


**Browse with Multiple filters using field ID/field name:**

Multiple Filters: Multiple facets can be selected which applies corresponding filters in a single call. There are two types of filter operations:  

* AND
* OR


**Browse with multiple filters using AND and field ID/field name:**:

`MultipleIdFilter` takes two parameters, field Id and Value id. 

`MultipleNameFilter` takes two parameters, field name and Value name. 

Multiple filters can be added and `operatorType` is set to ‘AND’.

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let multipleIdFilter = MultipleIdFilter()
multipleIdFilter.operatorType = .AND
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5001"))
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5021"))
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), multipleFilter:             multipleIdFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})    

OR

//Using field name
let multipleNameFilter = MultipleNameFilter()
multipleNameFilter.operatorType = .AND
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "Black"))
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "White"))
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), multipleFilter:             multipleIdFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Browse with multiple filters using OR and field ID/field name:**:

`MultipleIdFilter` takes two parameters, field Id and Value id.

`MultipleNameFilter` takes two parameters, field name and Value name.

Multiple filters can be added and `operatorType` is set to ‘OR’.


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//Using field ID
let multipleIdFilter = MultipleIdFilter()
multipleIdFilter.operatorType = .OR
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5001"))
multipleIdFilter.filters.append(IdFilter(field: "76678", value: "5021"))
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), multipleFilter:             multipleIdFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})    

OR

//Using field name
let multipleNameFilter = MultipleNameFilter()
multipleNameFilter.operatorType = .OR
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "Black"))
multipleNameFilter.filters.append(IdFilter(field: "vColor_uFilter", value: "White"))
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), multipleFilter:             multipleIdFilter)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Sorting**

The sort parameter is used to rank the products based on specified fields in the specified order. You can sort on a single field or on multiple fields.

For more information, see <a style="margin-top:0px" class="unbxd-know-more" target="_blank" href=" http://unbxd.com/documentation/site-search/v2-browse-rest-api/">here</a> (Request Parameters section).


**Browse with sorting on single field/multiple fields**

`field`: The field on which the sort is applied.

`Order`: The order in which the sort is applied. This value can be "ASC" (for ascending) or "DSC" (for descending)

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
//single field
var fieldsWithOrder = Array<FieldSortOrder>()
fieldsWithOrder.append(FieldSortOrder(field: "price", order: .ASC))
let browseQuery = BrowseQuery(categoryQuery: categoryQuery), fieldsSortOrder: fieldsWithOrder)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})


OR

//multiple fields hence 2 or more FieldSortOrder instances are added
var fieldsWithOrder = Array<FieldSortOrder>()
fieldsWithOrder.append(FieldSortOrder(field: "price", order: .ASC))
fieldsWithOrder.append(FieldSortOrder(field: "title", order: .DSC))

let browseQuery = BrowseQuery(categoryQuery: categoryQuery),                     fieldsSortOrder: fieldsWithOrder)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**Spellcheck**

The spellcheck feature provides spelling suggestions or spell-check for misspelled Browse queries. In such cases, the context-aware algorithm of Unbxd understands your visitor’s intent and sends a “Did You Mean” response along with Browse result set for the query, if any.

For more information, see <a style="margin-top:0px" class="unbxd-know-more" target="_blank" href=" http://unbxd.com/documentation/site-search/v2-browse-rest-api/">here</a>  (Request Parameters section).


<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let browseQuery = BrowseQuery(categoryQuery: categoryQuery)
, spellCheck: true)
client.browse(query: browseQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


## Unbxd Recommendations

Unbxd Recommendations is a set of tailored widgets that showcase personalised product suggestions to visitors on different pages of your online e-commerce store. The widgets are easy to configure and provides a smart way of exposing your inventory to the visitors.
These widgets are powered by the Unbxd analytics engine that constantly tracks and records visitor events on your store such as clicks, cart additions, orders, etc. The captured event information is used to build profiles that help our search engine to fetch relevant products for each widget.

The Unbxd SDK supports the following types of widgets:

* Recommended For You
* Recently Viewed
* More Like This
* Viewed also Viewed
* Bought also Bought
* Cart Recommendations
* Top Sellers
<ul style="margin-top: 5px; margin-bottom: 5px;">
<li>Homepage Top Sellers</li>
<li>Category Top Sellers</li>
<li>PDP Top Sellers</li>
<li>Brand Top Sellers</li>
</ul>
* Complete the Look

For more information about recommendations widgets and the suggested locations, see [here](http://unbxd.com/documentation/site-search/v2-recommendations-widgets-overview/).


### Using Recommendations Methods

**Recommendations method signature**:

<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
func recommend(recommendationQuery:RecommendationQuery, completion: @escaping (_response:Any?, _error:Error?) -> Void) {
// Handle response or request
}
```
</div>


### Examples

**RECOMMENDED FOR YOU**

The Recommended For You method returns recommendations based on the visitor’s interaction history on the online store or app.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let forYouQuery = RecommendedForYourRecomendations(uid: uid, region: "USA", currency: "USD", format: .JSON)
client.recommend(recommendationQuery: forYouQuery, completion:{(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**RECENTLY VIEWED**

The Recently Viewed method recommends products that were recently viewed by a visitor.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let recentlyViewedQuery = RecentlyViewedRecomendations(uid: uid, productID: "2312314", region: "USA")
client.recommend(recommendationQuery: recentlyViewedQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**MORE LIKE THESE**

The More Like These method is built to recommend products similar to the one being viewed on the PDP (Product Detail Page).

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let moreLikeThisQuery = MoreLikeThisRecomendations(uid: uid, productID: "2312314", region: "USA")
client.recommend(recommendationQuery: moreLikeThisQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**VIEWED ALSO VIEWED**

As the name suggests, this method recommends products viewed by other visitors. 

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let alsoViewedQuery = ViewedAlsoViewedRecomendations(uid: uid, productID: "2312314", region: "USA")
client.recommend(recommendationQuery: alsoViewedQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**BOUGHT ALSO BOUGHT**

Similar to the Viewed also Viewed method, the Bought also Bought method recommends products bought by other visitors.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let alsoBoughtdQuery = BoughtAlsoBoughtRecomendations(uid: uid, productID: "2312314", region: "USA")
client.recommend(recommendationQuery: alsoBoughtdQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**CART RECOMMENDATIONS**

This method recommends complementary products on the "Cart page" for those present in the visitor's cart.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let cartRecommendationQuery = CartRecomendations(uid: uid, region: "USA") client.recommend(recommendationQuery: cartRecommendationQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**HOMEPAGE TOP SELLERS**

This method recommends top selling products bought from the homepage.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let homePageTopSellerQuery = HomePageTopSellersRecomendations(uid: uid, region: "USA")
client.recommend(recommendationQuery: homePageTopSellerQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**CATEGORY TOP SELLERS**

This method recommends top selling products from a specific category. 

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let categoryTopSellerQuery = CategoryTopSellersRecomendations(uid: uid, region: "USA", categoryName: "<CategoryName>")
client.recommend(recommendationQuery: categoryTopSellerQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**PDP TOP SELLERS**

This method recommends top selling products from a specific product. 

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let pdpTopSellerQuery = PDPTopSellersRecomendations(uid: uid, region: "USA")
client.recommend(recommendationQuery: pdpTopSellerQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**BRAND TOP SELLERS**

This method recommends top selling products from a specific brand.  

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let brandTopSellerQuery = BrandTopSellersRecomendations(uid: uid, region: "USA", brandName: "Nike")
client.recommend(recommendationQuery: brandTopSellerQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>


**COMPLETE THE LOOK**

The Complete the Look method showcases curated products on a Product Display Page (PDP) that are usually associated with the original product.

Sample:
<div name="clipboard-text3" id="clipboard-text1” class="margin-left-h3">
<button class="ctb target-to-copy" data-clipboard-target="clipboard-text1” style="top: 20px;">Copy</button>
```javascript-language
let completeTheLookQuery = CompleteTheLookRecomendations(uid: uid, productID: "2312314", region: "USA")
client.recommend(recommendationQuery: completeTheLookQuery, completion: {(response:Any?, error:Error?) -> Void in
//Handle response
})
```
</div>

