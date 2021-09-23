# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- must use Rails 5.2.x
- must use PostgreSQL
- all code must be tested via feature tests and model tests, respectively
- must use GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- must include a thorough README to describe the project
- must deploy completed code to Heroku

## Setup

This project requires Ruby 2.7.2.
Rails version: 5.2.6

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.


* Or view on Heroku:
[Admin Dashboard](https://rocky-escarpment-73509.herokuapp.com/admin) / 
[Example Merchant Dashboard](https://rocky-escarpment-73509.herokuapp.com/merchants/1/dashboard)


## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)

## General info
This project creates an e-commerce platform that allows two types of users; merchants and admin. Each user type has its own set of paths, which access the appropriate features for the user type. 

## Schema
![Little Esty Shop Schema](https://user-images.githubusercontent.com/83726180/134429191-0397fbc7-75d4-4220-b61f-6cd846c9d834.png)
 
## Features
* As a merchant, the user is able to access the merchant dashboard where they can see navigational links to that merchants items and invoices, and statistics for that particular merchant including favorite customers and items ready to ship.
  * Merchant items are listed on an index page as links for their respective show pages. From this page, the merchant has the ability to create new items, edit existing items, and enable or disable their own items, which are dynamically sorted on the page based on that status. The merchant can also see their five most popular items and a top selling date based on the revenue generated by successful sales.
  * Merchant invoices are displayed on a separate index page, where each index links to its respective show page. On the show page for each invoice, the merchant can see details about the invoice, but will only see items that belong to them from the invoice. Additionally, the merchant will see a revenue total that only applies revenue for their items on the invoice.
* As an admin, the user is able to access the admin dashboard where they can see navigational links to an index of all merchants and an index of all invoices, as well as statistics for the top five highest spending customers on the site and incomplete invoices with unshipped items. 
  * All merchants are listed on the admin index page, where an admin user can create new merchants, see existing merchants sorted by enabled or disabled, and change that merchants status via a button next to each merchant. Admin users can also see statistics for top five merchants with the most revenue with the top selling date for that particular merchant.
  * Admin Invoices are listed on a separate index, where admin users can see all invoices which link to individual invoice pages. Each invoice show page displays details about the invoice and all items included on the order, including revenue. An admin user is also able to change the invoice status using a form pre-filled with the current status. 

## Status
Project is: in-progress


## Contact
Created by
* [@bdempsey864](https://github.com/bdempsey864)
* [@michaelpmattson](https://github.com/michaelpmattson)
* [@eakischuk](https://github.com/eakischuk)

~ feel free to contact us! ~
