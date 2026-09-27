from flask import Flask, render_template, request, jsonify

app = Flask(__name__,template_folder="../frontend",
            static_folder="../frontend",static_url_path="")

@app.route("/") 
def inicio():
    return  render_template("index.html")

@app.route("/analisar", methods=["POST"])
def analisar():
    dados = request.get_json()
    marca = dados["marca"]
    modelo = dados["modelo"]
    return jsonify({
        "marca": marca,
        "modelo": modelo,
    })


if __name__ == "__main__":
    app.run(debug=True)