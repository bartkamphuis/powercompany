# README

* Ruby version: ruby 3.2.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
```bash
bundle exec rspec -f d
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

-------------------------------------
coding without TDD:

1. Get the functionality in place
2. Make the code testable
3. Write tests

coding with TDD:

1. Write the tests
2. Get the functionality in place

The difference is small but significant.

------------------------------------
## Models and attributes

#### Customer

Attributes:

- name: Name of the customer.
- email: Email of the customer.
- balance: Current balance of prepaid units.

Associations:
- Has many purchases.

#### Pack

Attributes:
- name: Name of the pack.
- price: Price of the pack (use decimal type for this attribute).
- energy_units: Amount of energy units in the pack.

Associations:
- Has many purchases.

#### WholesaleDeal

Attributes:
- discount_rate: Discount rate for the packs (use decimal type for this attribute).
- start_date: Start date of the wholesale deal.
- end_date: End date of the wholesale deal.

#### Purchase
Attributes:

- purchase_date: Date when the purchase was made.

Associations:

- Belongs to customer.
- Belongs to pack.

generators to create these models:

```bash
rails generate model Customer name:string email:string balance:decimal
rails generate model Pack name:string price:decimal energy_units:decimal
rails generate model WholesaleDeal discount_rate:decimal start_date:date end_date:date
rails generate model Purchase purchase_date:date customer:references pack:references
```
