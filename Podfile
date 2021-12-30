# Uncomment the next line to define a global platform for your project

target 'NYTimesArticles' do
 pod 'Moya', '~> 15.0'
 pod 'Alamofire', '~> 5.5'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
