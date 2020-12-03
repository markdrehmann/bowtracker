# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - models set up inheriting from ActiveRecord, db migrations created tables for my models...
- [x] Include more than one model class (e.g. User, Post, Category) - User, Bow, Maker
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many :bows, has_many makers through bows
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Bow belongs to User, belongs to Maker
- [ ] Include user accounts with unique login attribute (username or email)
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - short desc, and install instructions. license is it's own file, not sure about contributors guide

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
