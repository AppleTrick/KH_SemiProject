var disease;
// *********************************************************
const promiseGet = (url) => {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.send();
    xhr.onload = () => {
      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.response));
      } else {
        reject(new Error(xhr.status));
      }
    };
  });
};
// *********************************************************
async function start() {
  await promiseGet("resources/json/AnimalDiseases.json").then((res) => (disease = res));

  document
    .getElementById("search-input")
    .addEventListener("keyup", function () {
      var value = this.value;
      console.log("Value:", value);
      var data = searchTable(value, disease);
      buildTable(data);
    });

  buildTable(disease);
}
// *********************************************************
function searchTable(value, disease) {
  var filteredData = [];

  for (var i = 0; i < disease.length; i++) {
    value = value.toLowerCase();
    var name = disease[i].질병명.toLowerCase();

    if (name.includes(value)) {
      filteredData.push(disease[i]);
    }
  }
  return filteredData;
}
// *********************************************************
function buildTable(disease) {
  var table = document.getElementById("myTable");

  table.innerHTML = "";

  for (var i = 0; i < 20; i++) {
    var row = `<tr>
                        <td>${disease[i].축종}</td>
                        <td>${disease[i].질병명}</td>
                        <td>${disease[i].주요증상}</td>
                    <tr>`;
    table.innerHTML += row;
  }
}

start();
