Pod::Spec.new do |s|
  s.name         = "SwiftyExt"
  s.version      = "1.0.0"
  s.summary      = "useful extensions for Swift"
  s.description  = <<-DESC
  					"useful extensions for Swift"
					DESC
  s.homepage     = "https://github.com/awd1559/SwiftyExt"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform	 = :ios, '8.0'
  s.requires_arc = true
  s.author       = { "awd1559" => "awd1559@gmail.com" }
  s.source       = { :git => "https://github.com/awd1559/SwiftyExt.git", :tag => s.version.to_s }
  s.source_files  = "SwiftyExt/*.swift", "SwiftyExt/SwiftyExt.h"
  s.public_header_files = "SwiftyExt/SwiftyExt.h"
end
