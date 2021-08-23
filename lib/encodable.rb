# frozen_string_literal: true

require_relative "encodable/version"

module Encodable
  class Error < StandardError; end

  class UrlEncode
    attr_reader :domain, :original_query

    def initialize(url)
      @domain, @original_query = url.split('?', 2)
    end

    def call
      return domain || '' if original_query.nil? || original_query.empty?

      "#{domain}?#{encode_params}"
    end

    def self.call(url)
      new(url).call
    end

    private

    def encode_params
      URI.encode_www_form(
        original_query.split('&')&.map { |q| q.split('=', 2) }
      )
    end
  end
end
