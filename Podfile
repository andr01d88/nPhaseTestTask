# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'nPhaseTestProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for nPhaseTestProject
  pod 'Mantle'
  pod 'ResearchKit'
  pod 'Realm'
  pod 'Realm/Headers'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "12.0"
    end
  end
end
