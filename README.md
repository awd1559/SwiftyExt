# SwiftyExt
>![Resize icon][1]    
>**Siwft Extensions**

##Install:
    pod 'SwiftyExt'

##Usage:


###String

```swift
//change to value
"true".toBool() // true
"2.00".toFloat() // 2.0
"2.00".toInt() // 2
"2014-06-03".toDate() // NSDate
"2014-06-03 13:15:01".toDateTime() // NSDate
"2.00".toDouble() // 2.0

//is judge
"fdafaf3".isAlpha() // false
"afaf35353afaf".isAlphaNumeric() // true
"33.0".isNumeric() // true
" ".isEmpty() // true
"hello world".isStartsWith("hello") // true
"hello world".isEndsWith("world") // true
"foobar".contains("foo") // true

//get substring
"hello world"[0...1] // "he"
"hello world"[0..<1] // "h"
"hello world"[0] // "h"
"hello world"[0...10] // "hello world"

"<a>foo</a>".between("<a>", "</a>") // "foo"

//set substring
var value = "foobar"
var.replace("foo", "fff")	//"fffbar"
var.replace(0, 3, "bbb")	//"bbbbar"


//misc
"hi".times(3) // "hihihi"

",".join(["a","b","c"]) // "a,b,c"

"hello world".split(" ")[0] // "hello"

String.rangeFromNSRange(NSRange) -> Range<Int>
```

```swift
"The Weekend &#8216;King Of The Fall&#8217;".decodeHTML() // "The Weekend ‘King Of The Fall’"
"<strong> 4 &lt; 5 &amp; 3 &gt; 2 .</strong> Price: 12 &#x20ac;.  &#64; ".decodeHTML() // "<strong> 4 < 5 & 3 > 2 .</strong> Price: 12 €.  @ "
"this is so &quot;good&quot;".decodeHTML() // "this is so \"good\""
```

###UIColor
```swift
UIColor(r:255, g:0, b:0)
UIColor(r:255, g:0, b:0, a:0.5)
```


###GCD
```swift
let task = delay(5) {
	//do somthing
}
cancle(task)
```

###UIImage
```
//image with rounded corner
let image = UIImage(named:"ok.png")
image.roundedCornerImageWithCornerRadius(3.0) 
```

###Misc
```swift
NSObject.Identifier()
```


	
##Reference:
* [SwiftyString](https://github.com/amayne/SwiftString)


[1]: http://resizesafari.com/favicon.ico "SwiftyExt"

