# milky_way

About Milky way 

Milky Way app uses NASA's Search API to allows users to scroll through the
list of Milky Way images taken in 2017.

Language 

This test was written in Flutter because it's what I'm most comfortable with and I'm hoping to convince you to take a look at flutter if you haven't already, I hop I succeed 😄

Architeture

The app was built on the principles of MVC (Model View Controller) Architecture. Concretely seperating View files from controller and data sources

External Packages 

  simple_animations: Used for staggered animation within the app
  supercharged: Used as a support for the simple_animation package.
  intl: Used for date formatting
  get: Used for state management
  cached_network_image: Used to cache network images to drastically reduce data consumption and load time of images
  flutter_svg: Used to parse and display svg files
