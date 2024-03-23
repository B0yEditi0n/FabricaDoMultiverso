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

  Future<String> addPoder(String efeitoID, String nome) async{
    List efeitos = this.listaEfeitos["EFECTS"];
    var objEfeito = efeitos[efeitos.indexWhere((efeito) => efeito["e_id"] == efeitoID)];
    // Inicia nova Instancia
    objEfeito["nomeDoPoder"] = nome;
    
    var poderObj = efeitosList.Efeito(objEfeito);
    
    // Define o ID
    poderObj.idPoder = 'P_${this.poderes.length + 1}';

    this.poderes.add(poderObj);

    
    return (poderObj.idPoder);
  }

  addModificador(String poderID, String modificadorID, int modGrad){
    var poder = this.poderes[this.poderes.indexWhere((poder) => poder.idPoder == poderID)];
    // Identifica se o modificador é genérico ou especifico
    var ObjModificador = {};
    if (modificadorID.substring(0,3) == 'ME'){
      // Modificador Especifico
      // Criar Posteriormente...
    }else{
      // Modificador Geral
      switch (poder.tipo) {
        case "atk":
          ObjModificador = listaModificadores["GERAL"][listaModificadores["GERAL"].indexWhere(
            (modificador) => ( modificador["ID"] == modificadorID )
          )];    
          print(ObjModificador);
          break;
        default:
      }
      
    };

    // Checa se o Modificador Já Existe na Lista
    print(poder.modificadores.indexWhere((modifcador) => modifcador["ID"] == modificadorID) > -1);     
    if(poder.modificadores.indexWhere((modifcador) => modifcador["ID"] == modificadorID) > -1){
      // ele será subistituido
      poder.modificadores.removeWhere((modifcador) => modifcador["ID"] == modificadorID);
    };
    
    // Atribui Graduação a Modificador
    if(ObjModificador["limite"] is int){
      if (ObjModificador["limite"] == 0) {
        //Limite Infinito
        ObjModificador["nivel"] = modGrad;
      }else{
        // Possui um Limite
        //Checa se O Limite Cumpre o Requsito
        if(ObjModificador["limite"] > modGrad){
          ObjModificador["nivel"] = ObjModificador["limite"];
        }else{
          ObjModificador["nivel"] = modGrad;
        }
      }

    }else{
      // Limite G graduação ou NP
      switch(ObjModificador["limite"]){
        case "G":
          if(modGrad > poder.Graduacao){
            ObjModificador["nivel"] = poder.Graduacao;
          }else{
            ObjModificador["nivel"] = modGrad;
          }
          break;

        case "NP":
          // Penso Futuramente...
          break;
      }

    }
    
    // Anexa Modificador ao Poder
    poder.modificadores.add(ObjModificador);
  }

  deletaPoder(String poderID){
    final listaPoderes = this.poderes;
    listaPoderes.removeWhere((poder) => poder.idPoder == poderID);

    /* Criar Refatoração de IDs */
  }

  deleteModificador(){
    
  }

  montaJson(){

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
  var poderid = await controladora.instanciaPoderes.addPoder('E001', 'Super Ataque');
  controladora.instanciaPoderes.addModificador(poderid, 'M003', 2);
  
  print(controladora.instanciaPoderes.poderes[0].modificadores);
  // controladora.instanciaPoderes.deletaPoder('P_1');
  controladora.instanciaPoderes.addModificador(poderid, 'M003', 1);
  print(controladora.instanciaPoderes.poderes[0].modificadores);
}