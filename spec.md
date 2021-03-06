# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - models set up inheriting from ActiveRecord, db migrations created tables for my models...
- [x] Include more than one model class (e.g. User, Post, Category) - User, Bow, Maker
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many :bows, has_many makers through bows
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Bow belongs to User, belongs to Maker
- [x] Include user accounts with unique login attribute (username or email) - username and email have validations for uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Bows have CRUD, Makers are readable, and restricted Create, Update, Destroy
- [x] Ensure that users can't modify content created by other users - using current_user and authorized_user? to add security
- [x] Include user input validations - signup has validations for username, email. Bows have validations for name, and might add validation for Maker
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - using Sinatra-flash to add flash messages and errors. specifically signup displays record.errors
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - short desc, and install instructions. license is it's own file, not sure about contributors guide

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
