class Translator {
  constructor(lng, tagAttr) {
    this.lng = lng;
    this.tagAttr = tagAttr;
  }

  translate() {
    const xrhFile = new XMLHttpRequest();

    xrhFile.open("GET", "./translations/" + this.lng + ".json", true);
    xrhFile.onload = () => {
      if (xrhFile.readyState === 4) {
        if (xrhFile.status === 200 || xrhFile.status == 0) {
          let LngObject = JSON.parse(xrhFile.responseText);
          const allDom = document.getElementsByTagName("*");
          for (let i = 0; i < allDom.length; i++) {
            let elem = allDom[i];
            const key = elem.getAttribute(this.tagAttr);
            if (key != null) {
              elem.innerHTML = LngObject[key];
            }
          }
        } else {
          console.error(xrhFile.statusText);
        }
      }
      xrhFile.onerror = () => {
        console.error(xrhFile.statusText);
      };
    };
    xrhFile.send(null);
  }
}
