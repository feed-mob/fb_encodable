# frozen_string_literal: true

RSpec.describe Encodable do
  it "has a version number" do
    expect(Encodable::VERSION).not_to be nil
  end

  describe '.call' do
    context 'when url is empty' do
      it 'should return with blank string' do
        url = ''
        expect(described_class::UrlEncode.call(url)).to eq ''
      end
    end

    context 'when url has no params' do
      it 'should return the original ourl' do
        url = 'http://test.com'
        expect(described_class::UrlEncode.call(url)).to eq url
      end
    end

    context 'when url has params' do
      it 'should return url with params' do
        url = 'http://test.com?a=1'

        expect(described_class::UrlEncode.call(url)).to eq url
      end
    end

    context 'when url params with special character' do
      it 'should return encoded' do
        url = 'http://test.com?a=/1/'

        expect(described_class::UrlEncode.call(url)).to eq 'http://test.com?a=%2F1%2F'
      end
    end
  end

  describe '.encode_params' do
    context 'when url has no params' do
      it 'should return with blank string' do
        url = 'http://test.com'
        expect(described_class::UrlEncode.new(url).send(:encode_params)).to eq ''
      end
    end
  end
end
