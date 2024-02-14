// app/javascript/dropdown.js

document.addEventListener('turbo:load', function() {
    // Find all dropdown toggles
    var dropdownToggles = document.querySelectorAll('.dropdown-toggle');
  
    // Loop through each dropdown toggle
    dropdownToggles.forEach(function(dropdownToggle) {
      // Check if the dropdown toggle has a corresponding dropdown menu
      var dropdownMenu = dropdownToggle.nextElementSibling;
      if (dropdownMenu && dropdownMenu.classList.contains('dropdown-menu')) {
        // Add event listener to the dropdown toggle
        dropdownToggle.addEventListener('click', function(event) {
          // Toggle the aria-expanded attribute when the dropdown is clicked
          var isExpanded = dropdownToggle.getAttribute('aria-expanded') === 'true' || false;
          dropdownToggle.setAttribute('aria-expanded', !isExpanded);
        });
      }
    });
  });
  