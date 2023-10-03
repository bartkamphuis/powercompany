# Power Company Application

This application simulates a power company's operations where customers can pre-pay for power packs, and purchase and use energy units.

## Ruby Version
- Ruby 3.2.2

## System Dependencies

- Rails 7.0.0
- PostgreSQL

## Configuration

Clone the repository and run `bundle install` to install the required gems and dependencies.

## Database Creation and Initialization

- Run `rails db:create` to create the database.
- Run `rails db:migrate` to run database migrations.
- Run `rails db:seed` to populate the database with initial data.

## Running the Test Suite

Run the following command to execute the test suite:

```bash
bundle exec rspec -f d
```

## Models
### Customer

Attributes:
* `name`: Name of the customer.
* `email`: Email of the customer.
* `balance`: Current balance of prepaid units in cents. Utilizes Money-rails gem to handle money attributes.

Associations:

* Has many purchases.

### Pack

Attributes:

* `name`: Name of the pack.
* `price_cents`: Price of the pack in cents. Utilizes Money-rails gem to handle money attributes.
* `energy_units`: Amount of energy units in the pack.

Associations:
* Has many purchases.

### WholesaleDeal

Attributes:
* `discount_rate`: Discount rate for the packs.
* `start_date`: Start date of the wholesale deal.
* `end_date`: End date of the wholesale deal.

Associations:
* Belongs to vendor (if applicable).
* Has many packs.

### Purchase

Attributes:

* `purchase_date`: Date when the purchase was made.

Associations:

* Belongs to customer.
* Belongs to pack.

