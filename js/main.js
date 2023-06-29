const themeButton = document.querySelector(".c-theme");

function toggleModal(modalTag) {
  const overlay = document.querySelector("#overlay");

  if (modalTag == null) return;

  modalTag.classList.toggle("u-active");
  overlay.classList.toggle("u-active");
  overlay.setAttribute("data-modal-target", `#${modalTag.id}`);
  document.body.classList.toggle("u-active");
}

function toggleTheme() {
  let themeName = "light";

  if (document.body.classList.contains("darkMode")) {
    themeButton.classList.add("ri-sun-line");
    themeButton.classList.remove("ri-moon-line");
    themeName = "light";
  } else {
    themeButton.classList.add("ri-moon-line");
    themeButton.classList.remove("ri-sun-line");
    themeName = "dark";
  }
  document.body.classList.toggle("darkMode");

  localStorage.setItem("theme", JSON.stringify(themeName));
}

function loadTheme() {
  let getTheme = JSON.parse(localStorage.getItem("theme"));

  if (getTheme === "dark") {
    document.body.classList.add("darkMode");
    themeButton.classList.add("ri-sun-line");
  }
}

loadTheme();

document.querySelector(
  "#copyright"
).innerHTML = `DG2003&copy;${new Date().getFullYear()}`;

document.querySelectorAll("[data-modal-target]").forEach((CloseButton) => {
  CloseButton.addEventListener("click", () => {
    const modalTag = document.querySelector(CloseButton.dataset.modalTarget);
    toggleModal(modalTag);
    console.log("fui clicado");
  });
});
