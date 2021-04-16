# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app <!-- used corneal gem/ uses sinatra -->
- [x] Use ActiveRecord for storing information in a database <!-- user + goals models>
- [x] Include more than one model class (e.g. User, Post, Category)<!-- user and goals -->
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) <!-- a user has_many goals -->
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)<!-- a goal belongs_to user >
- [x] Include user accounts with unique login attribute (username or email)<!-- login with username -->
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying <!-- goals controller has routes for CRUD -->
- [x] Ensure that users can't modify content created by other users <!-- logged_in? helper method keeps others from accessing another users account >
- [x] Include user input validations <!-- use empty? method to check input >
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)<!-- will add this shortly using flash message>
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message