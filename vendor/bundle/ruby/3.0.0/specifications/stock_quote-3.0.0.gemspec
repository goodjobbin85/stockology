# -*- encoding: utf-8 -*-
# stub: stock_quote 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "stock_quote".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ty Rauber".freeze]
  s.date = "2019-06-20"
  s.description = "Retrieve book, chart, company, delayed quote, dividends, earnings, effective spread, financials, stats, lists, logo, news, OHLC, open/close, peers, previous, price, quote, relevant, splits, timeseries, volume by venue and batch requests through IEX (iextrading.com/developer)".freeze
  s.email = ["tyrauber@mac.com".freeze]
  s.homepage = "https://github.com/tyrauber/stock_quote".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "A ruby gem that retrieves real-time stock quotes from IEX.".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0.1"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8.0"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 4.0.0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.4.2"])
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
    s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.8.0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 4.0.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.4.2"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
  end
end
