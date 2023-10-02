MoneyRails.configure do |config|

  config.default_currency = :nzd  # set default currency to NZD

  # Register a custom currency
  config.register_currency = {
    priority: 1,
    iso_code: "NZD",
    name: "New Zealand Dollar",
    symbol: "$",
    symbol_first: true,
    subunit: "Cent",
    subunit_to_unit: 100,
    thousands_separator: ",",
    decimal_mark: "."
  }

end