# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [ ] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) A user can sort movies by year in ascending and descending order.
- [X] Include signup (how e.g. Devise) there is a signup page.
- [X] Include login (how e.g. Devise) there is a login page.
- [X] Include logout (how e.g. Devise) there is a link to logout.
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) 3rd party signin via Google is a feature.
- [X] Include nested resource show or index (URL e.g. users/2/recipes) movies/1/reviews is an example of a nested resource.
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) movies/1/reviews/new is an example of a nested new form.
- [X] Include form display of validation errors (form URL e.g. /recipes/new) after rendering, the forms display validation errors.

Confirm:
- [X] The application is pretty DRY-partials and application layout is used.
- [X] Limited logic in controllers- check
- [X] Views use helper methods if appropriate-show pages especially utilize helper methods.
- [X] Views use partials if appropriate-forms utilize partials in each model.