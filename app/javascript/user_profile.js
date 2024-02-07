document.addEventListener("DOMContentLoaded", function() {
    const userProfile = document.getElementById("user-profile");
    const dropdownContent = document.getElementById("dropdown-content");
  
    if (userProfile && dropdownContent) {
      userProfile.addEventListener("click", function() {
        dropdownContent.classList.toggle("show");
      });
  
      document.addEventListener("click", function(event) {
        if (!event.target.matches('#user-profile')) {
          dropdownContent.classList.remove("show");
        }
      });
    }
  });
  