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
  int _totalCusto = 0;

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
    
  
    
  }

  carregaJson() async{ 
    final File jsonEfeitos = File('./efeitosLista.json');
    Future<String>  jsonSTR = jsonEfeitos.readAsString();
    print(await jsonSTR);
  } 

  addModificador(tipo, eNome, custo, modEfeito, parcial, descricao){
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

  }

  devolveDic(){
  Object  efeitoDic =  {
            'nomeDoPoder': this.nomeDoPoder,
            'nomeEfeito': this._efeitoBase,
            'acao': this._acao,
            'alcance': this._alcance,
            'duracao': this._duracao,
            'graduacao': this.Graduacao,
            'custo': this._custoBase,
            'pontos': this._processaCusto(),
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

/**1
 * Dicionario de Char Especiais
 */

/* 
$ = ç
4 = ã

*/
