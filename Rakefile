# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Quiver'
  app.deployment_target = '6.1'
  app.frameworks << 'AudioToolbox'
  app.bridgesupport_files << './app/AudioToolbox.bridgesupport'
end
