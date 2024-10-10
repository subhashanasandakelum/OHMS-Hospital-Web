document.addEventListener("DOMContentLoaded", function() {
        const currentPath = window.location.pathname;
        const sidebarLinks = document.querySelectorAll(".sidebar-menu li");

        sidebarLinks.forEach(link => {
            const anchor = link.querySelector("a");
            if (anchor && currentPath.includes(anchor.getAttribute("href"))) {
                link.classList.add("active");
            }
        });
});

function confirmLogout() {
    var confirmation = confirm("Are you sure you want to log out?");
     if (confirmation) {
       window.location.href = "LogoutServlet";
    }
}


