require "spec_helper"

WIKI_PREFIX = "/wiki/"
TEST_SLUG = "Hatsune_Miku"

def simplify_html(str)
  str.gsub(/>\s*</, "><").squeeze(" ")
end

describe WikipediaHtmlSanitize::Sanitize do
  describe "#sanitized_html" do
    let(:html_before) do
      File.read(File.expand_path("../../support/#{TEST_SLUG}_before.html", __FILE__))
    end

    let(:html_after) do
      File.read(File.expand_path("../../support/#{TEST_SLUG}_after.html", __FILE__))
    end

    let(:test_conn) do
      conn_stub = Faraday::Adapter::Test::Stubs.new do |conn|
        conn.get("#{WIKI_PREFIX}#{TEST_SLUG}") { |env| [200, {}, html_before] }
      end
      Faraday.new { |builder| builder.adapter(:test, conn_stub) }
    end

    it "should sanitize html" do
      sanitized_html = described_class.new(TEST_SLUG, test_conn).sanitized_html
      expect(simplify_html(sanitized_html)).to eq(simplify_html(html_after))
    end
  end
end
