module Milkbottle
  class JwtToken
    attr_accessor :audience, :email, :external_auth_issuer, :external_id
    def initialize(options)
      self.audience             = options[:audience]
      self.email                = options[:email]
      self.external_id          = options[:external_id]
      self.external_auth_issuer = options[:external_auth_issuer]
    end

    def to_hash
      { iss: external_auth_issuer, aud: audience, exp: expiry.to_i, sub: subject.to_s, email: email }
    end

    def encode(external_auth_key)
      regenerate if expired?
      JWT.encode(to_hash, external_auth_key)
    end

    def expiry
      @expiry ||= (Time.now + 3600 * 24)
    end

    def expired?
      expiry < Time.now
    end

    def subject
      external_id
    end

    def issuer
      external_auth_issuer
    end

    def regenerate
      @expiry = nil
    end
  end
end
