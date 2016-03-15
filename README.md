# SwiftyExt
>![Resize icon][1]    
>**Siwft Extensions**

##Install:
    pod 'SwiftyExt'

##Usage:
###String
	[contains](#contains)
	[between(left, right)](#between)
	[chompLeft](#chompLeft)
	[chompRight](#chompRight)
	[collapseWhitespace](#collapseWhitespace)
	[hasNumberOf](#hasNumberOf)
	[](#)
	[](#)
	[](#)
	[](#)
	[](#)
	[](#)
###String+HTML
	[decodeHTML](#decodeHTML)
	[encodeHTML_empty](#empty)
	
###String
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

**endsWith(suffix)**
```swift
"hello world".endsWith("world") // true
"hello world".endsWith("foo") // false
```

**ensureLeft(prefix)**
```swift
"/subdir".ensureLeft("/") // "/subdir"
"subdir".ensureLeft("/") // "/subdir"
```

**ensureRight(suffix)**
```swift
"subdir/".ensureRight("/") // "subdir/"
"subdir".ensureRight("/") // "subdir/"
```

**indexOf(substring)**
```swift
"hello".indexOf("hell"), // 0
"hello".indexOf("lo"), // 3
"hello".indexOf("world") // nil
```

**initials()**
```swift
"First".initials(), // "F"
"First Last".initials(), // "FL"
"First Middle1 Middle2 Middle3 Last".initials() // "FMMML"
```

**initialsFirstAndLast()**
```swift
"First Last".initialsFirstAndLast(), // "FL"
"First Middle1 Middle2 Middle3 Last".initialsFirstAndLast() // "FL"
```

**isAlpha()**
```swift
"fdafaf3".isAlpha() // false
"afaf".isAlpha() // true
"dfdf--dfd".isAlpha() // false
```

**isAlphaNumeric()**
```swift
"afaf35353afaf".isAlphaNumeric() // true
"FFFF99fff".isAlphaNumeric() // true
"99".isAlphaNumeric() // true
"afff".isAlphaNumeric() // true
"-33".isAlphaNumeric() // false
"aaff..".isAlphaNumeric() // false
```

**isEmpty()**
```swift
" ".isEmpty() // true
"\t\t\t ".isEmpty() // true
"\n\n".isEmpty() // true
"helo".isEmpty() // false
```

**isNumeric()**
```swift
"abc".isNumeric() // false
"123a".isNumeric() // false
"1".isNumeric() // true
"22".isNumeric() // true
"33.0".isNumeric() // true
"-63.0".isNumeric() // true
```

**join(sequence)**
```swift
",".join([1,2,3]) // "1,2,3"
",".join([]) // ""
",".join(["a","b","c"]) // "a,b,c"
"! ".join(["hey","who are you?"]) // "hey! who are you?"
```

**latinize()**
```swift
"šÜįéïöç".latinize() // "sUieioc"
"crème brûlée".latinize() // "creme brulee"
```

**lines()**
```swift
"test".lines() // ["test"]
"test\nsentence".lines() // ["test", "sentence"]
"test \nsentence".lines() // ["test ", "sentence"]
```

**pad(n, string)**
```swift
"hello".pad(2) // "  hello  "
"hello".pad(1, "\t") // "\thello\t"
```

**padLeft(n, string)**
```swift
"hello".padLeft(10) // "          hello"
"what?".padLeft(2, "!") // "!!what?"
```

**padRight(n, string)**
```swift
"hello".padRight(10) // "hello          "
"hello".padRight(2, "!") // "hello!!"
```

**startsWith(prefix)**
```swift
"hello world".startsWith("hello") // true
"hello world".startsWith("foo") // false
```

**split(separator)**
```swift
"hello world".split(" ")[0] // "hello"
"hello world".split(" ")[1] // "world"
"helloworld".split(" ")[0] // "helloworld"
```

**times(n)**
```swift
"hi".times(3) // "hihihi"
" ".times(10) // "          "
```

**toBool()**
```swift
"asdwads".toBool() // nil
"true".toBool() // true
"false".toBool() // false
```

**toFloat()**
```swift
"asdwads".toFloat() // nil
"2.00".toFloat() // 2.0
"2".toFloat() // 2.0
```

**toInt()**
```swift
"asdwads".toInt() // nil
"2.00".toInt() // 2
"2".toInt() // 2
```

**toDate()**
```swift
"asdwads".toDate() // nil
"2014-06-03".toDate() // NSDate
```

**toDateTime()**
```swift
"asdwads".toDateTime() // nil
"2014-06-03 13:15:01".toDateTime() // NSDate
```

**toDouble()**
```swift
"asdwads".toDouble() // nil
"2.00".toDouble() // 2.0
"2".toDouble() // 2.0
```

**trimmedLeft()**
```swift
"        How are you? ".trimmedLeft() // "How are you? "
```

**trimmedRight()**
```swift
" How are you?   ".trimmedRight() // " How are you?"
```

**trimmed()**
```swift
"    How are you?   ".trimmed() // "How are you?"
```

**slugify()**
```swift
"Global Thermonuclear Warfare".slugify() // "global-thermonuclear-warfare"
"Crème brûlée".slugify() // "creme-brulee"
```

**stripPunctuation()**
```swift
"My, st[ring] *full* of %punct)".stripPunctuation() // "My string full of punct"
```

**substring(startIndex, length)**
```swift
"hello world".substring(0, length: 1) // "h"
"hello world".substring(0, length: 11) // "hello world"
```

**[subscript]**
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




	
##Reference:
* [SwiftyString](https://github.com/amayne/SwiftString)


[1]: http://resizesafari.com/favicon.ico "SwiftyExt"

