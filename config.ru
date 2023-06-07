# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
use Rack::Cors do
    allow do
      origins 'localhost:3000', 'https://www.portal.sorcery.design'
  
      resource '/file/list_all/', :headers => 'x-domain-token'
      resource '/file/at/*',
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          headers: 'x-domain-token',
          expose: ['Some-Custom-Response-Header'],
          max_age: 600
          # headers to expose
    end
run Rails.application
Rails.application.load_server
