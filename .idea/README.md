Project Summary
This project implements a MySQL relational schema for managing student housing alongside a 
Java console application. The database tracks buildings, rooms, students, and payments. 
The Java app uses JDBC and a DAO layer to perform CRUD operations, run queries, and display 
results in the console.

Screenshots
SQL Queries
  Query 1: List students who have not yet been allocated a room
  Query 2: List students in a specific building
  Query 3: Calculate average rent per building
- Query 4: List rooms that are available for occupacy.
- 
Java App Features
  Feature 1: Display all students in the database
  Feature 2: Display rooms that are available for rent
- Feature 3: Create a new contract
- 
  Reflection
- This is my first project working with MYSQL Workbench hence setting up took me a bit of time. I took a step and focused on reading material on MYSQL before attempting to work on the project again. I managed to succeed due to the new knowledge I had gained. 
- JDBC connection errors popped up when credentials mismatched; enabling autoReconnect=true in the JDBC URL and detailed logging helped isolate the issue. 
- Finally, designing the DAO layer taught me clear separation of concerns: each DAO class now handles a single table, making testing and maintenance far easier.

