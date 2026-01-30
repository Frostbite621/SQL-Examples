# Project Overview

## Project Purpose
This project demonstrates an end-to-end retail analytics workflow, from relational data modeling to analytical dataset creation and visualization. The goal is to showcase SQL proficiency, data modeling skills, and analytical thinking using tools commonly found in industry environments.

## Business Context
The dataset represents a fictional retail e-commerce company selling products across multiple categories and regions. Customers place orders consisting of multiple line items, with the possibility of partial or full returns. This structure enables analysis of revenue performance, customer behavior, and product trends.

## Data Model Overview
The core data model is a normalized PostgreSQL schema consisting of:
- Customers (customer attributes and segmentation)
- Products (product catalog and pricing)
- Orders (transaction-level data)
- Order items (line-level sales details)
- Returns (negative revenue events)

This normalized structure serves as the system of record and supports data integrity through foreign key constraints.

## Data Sources
The data used in this project is synthetically generated to simulate realistic transactional behavior. A denormalized flat dataset (~200k rows) is used for analytical workflows in Excel and Tableau, while the normalized relational model is populated via an ETL-style process.

## Tools & Technologies
- PostgreSQL (data modeling, storage, and querying)
- Excel (data validation and exploratory analysis)
- Tableau (dashboarding and visualization)
- GitHub (version control and documentation)

## Project Scope & Roadmap
**Completed:**
- Relational schema design
- Synthetic data generation
- Project structure and documentation setup
-  ETL process to load flat data into relational tables
- Data validation and integrity checks
- Business-driven analytical SQL queries

**In Progress / Upcoming:**
- Tableau dashboard development