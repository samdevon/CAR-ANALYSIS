const botao = document.querySelector("button");

botao.addEventListener("click", function() {
    const marca = document.querySelector("#marca").value;
    const modelo = document.querySelector("#modelo").value;

    console.log("Marca:", marca);
    console.log("Modelo:", modelo);
    
    fetch ("/analisar", {
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body: JSON.stringify({
            marca: marca,
            modelo: modelo,
        })
    })
    .then(response => response.json())
    .then(dados => {console.log(dados);})
});

