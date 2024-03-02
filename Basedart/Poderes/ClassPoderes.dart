import 'dart:async';
import 'dart:io';
import 'dart:convert';

// import './efeitosLista.json' as efeitosJsonList;


/* Classe de Modificadores */
class Modificadores{
  // final user = jsonDecode() as Map<String, dynamic>;
  String nome = '';
  int custo = 0;
  int parcial = 0;
  String descricao = '';

  /* Se custo são por Rank ou fixos */
  bool fixo = false;

  processaDic(){
    var objReturn = {};
    objReturn['nome'] = this.nome;
    objReturn['descricao'] = this.descricao;
    
    if (this.fixo){
      objReturn['custoGrad'] = 0;
      objReturn['custoFixo'] = this.custo;
    }else{
      objReturn['custoGrad'] = this.custo;
      objReturn['custoFixo'] = 0;
    }
    
    objReturn['parcial'] = this.parcial;
            
    return (objReturn);    
  }
}

/* Classe de Construção dos Poderes */
class Efeito{
  
  String _idEfeito = '';
  String tipo = '';

  String _efeitoBase = '';
  String nomeDoPoder = '';

  /* Custo e Gradualção */
  int Graduacao = 0;
  int _custoBase = 0;
  //int _totalCusto = 0;

  /* Valores de Efeito */
  int _acao = 0;
  
  /*
    0 - Nenhuma
    1 - Padrao
    2 - Movimento
    3 - Livre
    4 - Reação
  */


  int _alcance = 0;
  /* 
    0 - Pessoal
    1 - Perto
    2 - A Distância
    3 - Percepção
    4 - Graduação
  */


  int _duracao = 0;
  /*
     0 - Permente
     1 - Instantanêo
     2 - Concentração
     3 - Sustentado
     4 - Contínuo 
  */

  var modificadores = [];//List<dynamic>
  
  // construtor
   Efeito(String idEfeito, String nomePoder) {
    this._idEfeito = idEfeito;
    this.nomeDoPoder = nomePoder;
    
    
    // Busca Atributos Base
    this.carregaBase();

  }

  Future<bool> carregaBase() async{
    final jsonObj = await this.carregaJson('efeitosLista');
    
    var efeito = {};
    for(var i = 0; i < jsonObj['EFECTS'].length; i++){
      efeito = jsonObj['EFECTS'][i];
      if(efeito['ID'] == _idEfeito){
        break;
      }
    }

    /* Prenche Atributos Base */
    this._efeitoBase = efeito['NOME'];
    this._custoBase = efeito['CUSTO_BASE'];
    this._acao = efeito['ACAO'];
    this._alcance = efeito['ALCANCE'];
    this._duracao = efeito['DURACAO'];

    return true;
    
  }

  Future carregaJson(json) async{
    String currentDirectory = Directory.current.path;
    var jsonEfeitos = await File('${currentDirectory}/Poderes/${json}.json').readAsString();
    var objetoJson = jsonDecode(jsonEfeitos);
    return(objetoJson);
    // print(await jsonSTR)
  }

  Future<bool>  addModificador(modifcadorID =) async{
    /* instancia a class */
    var modificadorEfeito = new Modificadores();
    modificadorEfeito.nome = eNome;
    modificadorEfeito.custo = custo;
    modificadorEfeito.parcial = parcial;
    modificadorEfeito.descricao = descricao;
    /*
      EG - Extra por Graduação
      EF - Extra Fixo
      FG - Falha por Graduação
      FF - Falha Fixa
    */
    if (tipo == 'EG' || tipo == 'FG'){
      modificadorEfeito.fixo = false;
    }
    else if (tipo == 'EF' || tipo == 'FF'){
      modificadorEfeito.fixo = true;
    }
    
    /* 
      Futuramente implementar modificação de funcionamento
     */
    //
    // ...
    //

  }

  _processaCusto() async{
    /* Custo Básico */
    var valor_do_efeito = _custoBase * Graduacao;

    return (valor_do_efeito);
  }

  devolveDic() async{
  Object  efeitoDic =  {
            'nomeDoPoder': this.nomeDoPoder,
            'efeito': this._efeitoBase,
            'acao': this._acao,
            'alcance': this._alcance,
            'duracao': this._duracao,
            'graduacao': this.Graduacao,
            'custo': this._custoBase,
            'pontos': await this._processaCusto(),
            'modificadores': this.modificadores
        };
        return efeitoDic;
  }
  

}


class EfeitosOfensivos extends Efeito{

  EfeitosOfensivos(super._idEfeito, super.nomePoder);
  int acerto = 0;
  int baseCD = 0;
}

class EfeitoDano extends EfeitosOfensivos{
  EfeitoDano(super._idEfeito, super.nomePoder);
  efeitoDano(){
    this.baseCD = 15;
  }
  
}

class EfeitoOfensivo extends EfeitosOfensivos{
  EfeitoOfensivo(super._idEfeito, super.nomePoder);
  efeitoOfensivo(){
    this.baseCD = 10;
  }
}

/**
 * Dicionario de Char Especiais
 */

/* 
$ = ç
4 = ã

*/
