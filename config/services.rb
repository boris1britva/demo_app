# Load 3rd party service passwords from config/services.rb.
# This is patch code to support config/services.rb till we upgrade to Rails 4.1.
# TODO: Remove this section after upgrading to Rails 4.1.

# Borrowed from rails/railties/lib/rails/application/configuration.rb
config.paths.add "config/secrets", with: "config/secrets.yml"

# Borrowed from rails/railties/lib/rails/application.rb
def secrets #:nodoc:
  @secrets ||= begin
    secrets = ActiveSupport::OrderedOptions.new
    yaml = config.paths["config/secrets"].first
    if File.exist?(yaml)
      require "erb"
      all_secrets = YAML.load(ERB.new(IO.read(yaml)).result) || {}
      env_secrets = all_secrets[Rails.env]
      secrets.merge!(env_secrets.symbolize_keys) if env_secrets
    end

    # Fallback to config.secret_key_base if secrets.secret_key_base isn't set
    secrets.secret_key_base ||= config.secret_key_base

    secrets
  end
end