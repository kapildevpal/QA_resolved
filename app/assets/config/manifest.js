//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js
  //= link bootstrap.min.js
  $(':radio').change(function() {
    console.log('New star rating: ' + this.value);
  });