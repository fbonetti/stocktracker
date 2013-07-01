require 'net/http'
require 'json'

class Stock < ActiveRecord::Base
  attr_accessible :amount, :name, :purchase_price, :symbol
  validates :symbol, presence: true, uniqueness: { case_sensitive: false }
  before_save :default_values, :get_company_name

  def default_values
    self.symbol.upcase!
    self.amount ||= 0
    self.purchase_price ||= 0
  end

  def get_company_name
    if self.name.empty?
      url = "http://query.yahooapis.com/v1/public/yql?q=select%20Name%20from%20yahoo.finance.quotes%20where%20symbol%20%3D%20%22#{ self.symbol.upcase }%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
      res = Net::HTTP.get(URI(url))
      json = JSON.parse(res)
      self.name = json["query"]["results"]["quote"]["Name"]
    end
  end

end
