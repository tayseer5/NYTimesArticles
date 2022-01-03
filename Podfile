# Uncomment the next line to define a global platform for your project

target 'NYTimesArticles' do
 pod 'Moya', '~> 15.0'
 # kindFisher one of best libraries for render image cashing and handling placholder
 pod 'Kingfisher', '~> 7.0'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
