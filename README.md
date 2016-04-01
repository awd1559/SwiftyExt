# SwiftyExt
>![Resize icon][1]    
>**Siwft Extensions**

##Install:
    pod 'SwiftyExt'

##Usage:
###String
- [toBool](#toBool)
- [toFloat](#toFloat)
- [toInt](#toInt)
- [toDate](#toDate)
- [toDateTime](#toDateTime)
- [toDouble](#toDouble)
- [isAlpha](#isAlpha)
- [isAlphaNumberic](#isAlphaNumberic)
- [isNumberic](#isNumberic)
- [isEmpty](#isEmpty)
- [indexAt](#indexAt)
- [indexOf](#indexOf)
- [contains](#contains)
- [hasNumberOf](#hasNumberOf)
- [startsWith](#startsWith)
- [endsWith](#endsWith)
- [between](#between)
- [chompLeft](#chompLeft)
- [chompRight](#chompRight)
- [collapseWhitespace](#collapseWhitespace)
- [trimmedLeft](#trimmedLeft)
- [trimmedRight](#trimmedRight)
- [trimmed](#trimmed)
- [times](#times)
- [join](#join)
- [split](#split)
- [substring](#substring)
- [subscript](#subscript)
  - [String+HTML](#StringHTML)
    - [decodeHTML](#decodeHTML)
    - [encodeHTML_empty](#empty)

###UIColor
- [init](#UIColor1)
- [init](#UIColor2)

###GCD
- [delay](#delay)
- [cancel](#delay)

###UIImage
- [roundedCornerImage](#UIImage1)

###Misc
- [Identifier](#Identifier)

###String
<span id="toBool">**toBool()**</span>
```swift
"asdwads".toBool() // nil
"true".toBool() // true
"false".toBool() // false
```

<span id="toFloat">**toFloat()**</span>
```swift
"asdwads".toFloat() // nil
"2.00".toFloat() // 2.0
"2".toFloat() // 2.0
```

<span id="toInt">**toInt()**</span>
```swift
"asdwads".toInt() // nil
"2.00".toInt() // 2
"2".toInt() // 2
```

<span id="toDate">**toDate()**</span>
```swift
"asdwads".toDate() // nil
"2014-06-03".toDate() // NSDate
```

<span id="toDateTime">**toDateTime()**</span>
```swift
"asdwads".toDateTime() // nil
"2014-06-03 13:15:01".toDateTime() // NSDate
```

<span id="toDouble">**toDouble()**</span>
```swift
"asdwads".toDouble() // nil
"2.00".toDouble() // 2.0
"2".toDouble() // 2.0
```

<span id="isAlpha">**isAlpha()**</span>
```swift
"fdafaf3".isAlpha() // false
"afaf".isAlpha() // true
"dfdf--dfd".isAlpha() // false
```

<span id="isAlphaNumberic">**isAlphaNumeric()**</span>
```swift
"afaf35353afaf".isAlphaNumeric() // true
"FFFF99fff".isAlphaNumeric() // true
"99".isAlphaNumeric() // true
"afff".isAlphaNumeric() // true
"-33".isAlphaNumeric() // false
"aaff..".isAlphaNumeric() // false
```

<span id="isNumberic">**isNumeric()**</span>
```swift
"abc".isNumeric() // false
"123a".isNumeric() // false
"1".isNumeric() // true
"22".isNumeric() // true
"33.0".isNumeric() // true
"-63.0".isNumeric() // true
```

<span id="isEmpty">**isEmpty()**</span>
```swift
" ".isEmpty() // true
"\t\t\t ".isEmpty() // true
"\n\n".isEmpty() // true
"helo".isEmpty() // false
```

<span id="indexAt">**indexAt(at)**</span>
```swift
"hello".indexAt(3)  //l
"hello".indexAt(0)  //h
```

<span id="indexOf">**indexOf(substring)**</span>
```swift
"hello".indexOf("hell"), // 0
"hello".indexOf("lo"), // 3
"hello".indexOf("world") // nil
```

<span id="contains">**contains(substring)**</span>
```swift
"foobar".contains("foo") // true
"foobar".contains("bar") // true
"foobar".contains("something") // false
```

<span id="hasNumberOf">**hasNumberOf(string)**</span>
```swift
"hi hi ho hey hihey".hasNumberOf("hi") // 3
```

<span id="startsWith">**startsWith(prefix)**</span>
```swift
"hello world".startsWith("hello") // true
"hello world".startsWith("foo") // false
```

<span id="endsWith">**endsWith(suffix)**</span>
```swift
"hello world".endsWith("world") // true
"hello world".endsWith("foo") // false
```

<span id="between">**between(left, right)**</span>
```swift
"<a>foo</a>".between("<a>", "</a>") // "foo"
"<a><a>foo</a></a>".between("<a>", "</a>") // "<a>foo</a>"
"<a>foo".between("<a>", "</a>") // nil
"<a></a>".between("<a>", "</a>") // nil
 "<a>foo</a>".between("<a>", "<a>") // nil
```

<span id="chompLeft">**chompLeft(string)**</span>
```swift
"foobar".chompLeft("foo") // "bar"
"foobar".chompLeft("bar") // "foo"
```

<span id="chompRight">**chompRight(string)**</span>
```swift
"foobar".chompRight("bar") // "foo"
"foobar".chompRight("foo") // "bar"
```

<span id="collapseWhitespace">**collapseWhitespace()**</span>
```swift
"  String   \t libraries are   \n\n\t fun\n!  ".collapseWhitespace() // "String libraries are fun !")
```

<span id="trimmedLeft">**trimmedLeft()**</span>
```swift
"        How are you? ".trimmedLeft() // "How are you? "
```

<span id="trimmedRight">**trimmedRight()**</span>
```swift
" How are you?   ".trimmedRight() // " How are you?"
```

<span id="trimmed">**trimmed()**</span>
```swift
"    How are you?   ".trimmed() // "How are you?"
```

<span id="times">**times(n)**</span>
```swift
"hi".times(3) // "hihihi"
" ".times(10) // "          "
```

<span id="join">**join(sequence)**</span>
```swift
",".join([1,2,3]) // "1,2,3"
",".join([]) // ""
",".join(["a","b","c"]) // "a,b,c"
"! ".join(["hey","who are you?"]) // "hey! who are you?"
```

<span id="split">**split(separator)**</span>
```swift
"hello world".split(" ")[0] // "hello"
"hello world".split(" ")[1] // "world"
"helloworld".split(" ")[0] // "helloworld"
```

<span id="substring">**substring(startIndex, length)**</span>
```swift
"hello world".substring(0, length: 1) // "h"
"hello world".substring(0, length: 11) // "hello world"
```

<span id="subscript">**[subscript]**</span>
```swift
"hello world"[0...1] // "he"
"hello world"[0..<1] // "h"
"hello world"[0] // "h"
"hello world"[0...10] // "hello world"
```

<span id="decodeHTML">**decodeHTML()**</span>
```swift
"The Weekend &#8216;King Of The Fall&#8217;".decodeHTML() // "The Weekend ‘King Of The Fall’"
"<strong> 4 &lt; 5 &amp; 3 &gt; 2 .</strong> Price: 12 &#x20ac;.  &#64; ".decodeHTML() // "<strong> 4 < 5 & 3 > 2 .</strong> Price: 12 €.  @ "
"this is so &quot;good&quot;".decodeHTML() // "this is so \"good\""
```

###UIColor
<span id="UIColor1">**init(r:g:b:)**</span>
```swift
UIColor(r:255, g:0, b:0)
```

<span id="UIColor2">**init(r:g:b:a)**</span>
```swift
UIColor(r:255, g:0, b:0, a:0.5)
```

###GCD
<span id="delay">**delay(timeinterval)**</span>
```swift
let task = delay(5) {
	//do somthing
}
cancle(task)
```

###UIImage
<span id="UIImage1">**roundedCornerImage**</span>
```
//image with rounded corner
let image = UIImage(named:"ok.png")
image.roundedCornerImageWithCornerRadius(3.0) 
```


###Misc
<span id="Identifier">**Identifier**</span>
```swift
NSObject.Identifier()
```


	
##Reference:
* [SwiftyString](https://github.com/amayne/SwiftString)


[1]: http://resizesafari.com/favicon.ico "SwiftyExt"

