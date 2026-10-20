# NordicTech Helpdesk — SQL Server Database Project

## Project Overview

NordicTech Helpdesk is a personal SQL portfolio project simulating an IT service desk incident management system.

The project demonstrates relational database design, primary and foreign key relationships, data integrity, and the management of support tickets, technician assignments, and escalation records.

All data is synthetic and created for educational purposes.

## Technologies

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)

## Database Structure

The database consists of five related tables:

| Table | Description |
|---|---|
| `users` | Employees reporting IT incidents |
| `technicians` | IT support technicians and support levels (L1–L3) |
| `tickets` | Incident details, priorities, statuses, and resolution timestamps |
| `ticket_updates` | History of incident status changes |
| `escalations` | Incident transfers between support technicians |

## Project Files

- `01_database_schema_clean.sql` — Creates the database and its relational tables, keys, and constraints.
- `02_sample_data.sql` — Inserts 26 synthetic records across the five tables.

## Installation

**Requirements:** Microsoft SQL Server and a SQL client such as SSMS.

1. Open `01_database_schema_clean.sql` in SSMS.
2. Execute the script to create the `NordicTech_Helpdesk` database and its tables.
3. Open `02_sample_data.sql`.
4. Execute the sample-data script once to populate the tables.

Run these scripts on a fresh database. They are not designed to be rerun against populated tables.

The schema and sample-data scripts have been tested successfully using a separate SQL Server test database.

## Future Development

Planned additions include:

- SQL queries for incident analysis and data validation
- Service desk performance indicators and resolution-time reporting
- Advanced SQL queries using CTEs and window functions
- Power BI dashboards for incident reporting and operational insights

## Author

Deniz Arman

[LinkedIn](https://www.linkedin.com/in/denizarman/)
