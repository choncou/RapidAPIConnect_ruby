require 'singleton'

class MissingCredentialsError < RuntimeError
end

class RapidAPI::Config
  def self.setup(**args)
    @@project = args[:project]
    @@api_key = args[:api_key]
    return
  end

  def self.project
    @@project || raise(MissingCredentialsError, 'Credentials not set')
  end

  def self.api_key
    @@api_key || raise(MissingCredentialsError, 'Credentials not set')
  end
end