const themeButton = document.querySelector(".c-theme");

function toggleModal(modalTag) {
  const overlay = document.querySelector("#overlay");

  if (modalTag == null) return;
  else if (modalTag.id == "js-knowProblemsPopup") {
    //this is one of the moments you sure that you don't know what you are doing LOL ;)
  } else {
    overlay.classList.toggle("u-active");
    overlay.setAttribute("data-modal-target", `#${modalTag.id}`);
    document.body.classList.toggle("u-active");
  }

  modalTag.classList.toggle("u-active");
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
  });
});

function goToPolicies() {
  const hash = window.location.hash;
  const privacyID = document.querySelector("#js-privacyPopup");
  const conditionsID = document.querySelector("#js-termsConditionsPopup");
  if (hash == "#privacy") {
    toggleModal(privacyID);
  } else if (hash == "#conditions") {
    toggleModal(conditionsID);
  } else if (hash == "#privacy&conditions") {
    toggleModal(privacyID);
    toggleModal(conditionsID);
  } else return;
}

goToPolicies();
