Pod::Spec.new do |spec|
  spec.name = "ViewControllerDescribable"
  spec.version = "1.0.0"
  spec.summary = "A simple way to switch between controllers."
  spec.homepage = "https://github.com/AndrewKochulab/ViewControllerDescribable"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Andrew Kochulab" => 'andrew.kochulab@gmail.com' }
  spec.social_media_url = "http://vk.com/ko4ylab"

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/AndrewKochulab/ViewControllerDescribable.git", tag: "master", submodules: false }
  spec.source_files = "ViewControllerDescribable/**/*.{h,swift}"
end