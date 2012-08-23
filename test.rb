#!/usr/bin/ruby
require 'haml'
require 'yaml'
require 'hmac-md5'

locals = { :data  => YAML.load( File.read( 'data.yml' ) )}
ARGV.each do |file|
	content = Haml::Engine.new( File.read( "svg.haml" ) ).render( Object.new, locals ) do
		Haml::Engine.new( File.read( file ) ).render( Object.new, locals )
	end
	File.write( "#{file}-test.svg", content )
end
