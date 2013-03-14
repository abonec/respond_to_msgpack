require 'msgpack'
require 'core_ext'
Mime::Type.register "application/msgpack", :msgpack
ActionController::Renderers.add :msgpack do |data, options|
  data = data.as_json(options.slice :only, :include, :methods).to_msgpack 
  self.content_type = Mime::MSGPACK
  self.response_body = data
end
