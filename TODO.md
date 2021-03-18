1.Plan Application.

--changes made to corneal
    1. removed env requirement from application controller
    2. removed database cleaner
    3. unlocked all gem versions 
    4. removed thin 

Users 
    - have a username, email, and password
        --salt and encyrpt password using bcrypt
    - have many goals
    - can set goals
    - can complete goals

Goals
    - belong to a User
    - have a title, desc, and can be completed (MVP) 
    - stretch features (start date, goal date, completed date)
        -- can be categorized as daily, weekly, monthly, or yearly goals

A User can sign up or log in, create goals, edit and delete goals that they created.