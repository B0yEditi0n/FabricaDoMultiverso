// Base
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';

// Modulos do Programa
import 'Poderes/ClassPoderes.dart' as efeitosList;

class instanciadoraDePoderes {
  // Lista Objeto dos Poderes
  List<efeitosList.Efeito> poderes = [];

  // Atributo Objetos
  var listaEfeitos = {};
  var listaModificadores = {};

  Future<bool> carregaBase() async{
    // Carrega Jsons Bases
    this.listaEfeitos = await this.carregaJson("efeitosLista");
    this.listaModificadores = await this.carregaJson("modificadores");

    return true;
  }

  Future carregaJson(json) async{
    String currentDirectory = Directory.current.path;
    var jsonEfeitos = await File('${currentDirectory}/Poderes/${json}.json').readAsString();
    var objetoJson = jsonDecode(jsonEfeitos);

    return(objetoJson);

  }

  Future<bool> addPoder(String efeitoID, String nome) async{
    List efeitos = this.listaEfeitos["EFECTS"];
    
    var objEfeito = efeitos[efeitos.indexWhere((efeito) => efeito["e_id"] == efeitoID)];
    // Inicia nova Instancia
    objEfeito["nomeDoPoder"] = nome;
    
    var poderObj = efeitosList.Efeito(objEfeito);
    
    // Define o ID
    poderObj.idPoder = 'P_${this.poderes.length + 1}';

    this.poderes.add(poderObj);

    
    return true;
  }

  addModificador(String poderID, String modificadorID){
    var poder = this.poderes[this.poderes.indexWhere((poder) => poder.idPoder == poderID)];
    // Identifica se o modificador é genérico ou especifico
    
    if (modificadorID.substring(0,3) == 'ME'){
      // Modificador Especifico
      int modIndex = poder.modificadores.indexWhere((modificador) => modificador["id"] == modificadorID);
      var ObjModificador = poder.modificadores[modIndex];
    }else{
      // Modificador Geral
      switch (poder.tipo) {
        case "atk":
          // var ObjModificador = listaEfeitos["Geral"];    
          break;
        default:
      }
      
    };
    
  }

  deletaPoder(String poderID){
    final listaPoderes = this.poderes;
    listaPoderes.removeWhere((poder) => poder.idPoder == poderID);
  }

  deleteModificador(){
    
  }
}

class Instanciadora{
  var nomePersonagem = "";
  var np = 10;
  var pontosPorLevel = 15;

  // Classe de Poderes
  var instanciaPoderes = new instanciadoraDePoderes();

  Future<bool> Inicializar() async{
    await instanciaPoderes.carregaBase();
    return true;
  }
  // addPoderes() async{
  //   var poderes = new efeitosList.Efeito('E026', 'Telecinese');
  //   await poderes.carregaBase();
  //   poderes.Graduacao = 5;
  //   print(await poderes.devolveDic());
  // }
}


void main() async{
  final controladora = new Instanciadora();
  await controladora.Inicializar();
  controladora.instanciaPoderes.addPoder('E001', 'Super Ataque');

  controladora.instanciaPoderes.deletaPoder('P_1');
}