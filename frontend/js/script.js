const botao = document.querySelector("button");

botao.addEventListener("click", function() {
    const marca = document.querySelector("#marca").value;
    const modelo = document.querySelector("#modelo").value;

    console.log("Marca:", marca);
    console.log("Modelo:", modelo);
});