// فتح المشروع في iframe
function openProject(page) {
  document.getElementById("project-frame").src = page;
  document.getElementById("project-frame").style.display = "block";
  document.getElementById("back-btn").style.display = "block";
  document.querySelector(".projects-grid").style.display = "none";
  document
    .getElementById("project-frame")
    .scrollIntoView({ behavior: "smooth" });
}

// إغلاق المشروع والرجوع إلى قائمة المشاريع
function closeProject() {
  document.getElementById("project-frame").style.display = "none";
  document.getElementById("back-btn").style.display = "none";
  document.querySelector(".projects-grid").style.display = "flex";
  window.scrollTo({ top: 0, behavior: "smooth" });
}
