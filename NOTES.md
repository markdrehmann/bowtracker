BowTracker

models - user, bow, maker

ATTRIBUTES
User    - username, email, password (required)
Bow     - instrument, user_id, maker_id (required)
        - last_sold_price, last_sold_date, weight, balance, length, materials, shape, year_made, strength, brand, notes (optional)
Maker   - name, nationality (required)
        - year_born, year_died, city, bio (optional)

_____
RELATIONSHIPS
User    - has many bows
        - has many makers, through bows

Bow     - belongs to user
        - belongs to maker

Maker   - has many bows
        - has many users, through bows?


User can log on, home page - select to see user's bows (/users/:id), all bows (/bows), all makers (/makers)

User can create a new bow, edit/delete their own bows

Bow show page - individual bow's attributes - NOT owner??
Maybe make it so Makers can't be edited... or find some way to keep users from entering wrong info?
- possibly Makers don't have a '/new' page, they can only be created in '/bows/new'


- one way to expand, a User can either be a musician or a maker? not sure how to have subclasses of users...
- another expansion would be adding photos to the bow instances
