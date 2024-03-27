import 'dart:async';
import 'dart:io';
import 'dart:convert';

// import './efeitosLista.json' as efeitosJsonList;


// /* Classe de Modificadores */
// class Modificadores{
//   // final user = jsonDecode() as Map<String, dynamic>;
//   String nome = '';
//   int custo = 0;
//   int parcial = 0;
//   String descricao = '';

//   /* Se custo são por Rank ou fixos */
//   bool fixo = false;

//   processaDic(){
//     var objReturn = {};
//     objReturn['nome'] = this.nome;
//     objReturn['descricao'] = this.descricao;
    
//     if (this.fixo){
//       objReturn['custoGrad'] = 0;
//       objReturn['custoFixo'] = this.custo;
//     }else{
//       objReturn['custoGrad'] = this.custo;
//       objReturn['custoFixo'] = 0;
//     }
    
//     objReturn['parcial'] = this.parcial;
            
//     return (objReturn);    
//   }
// }

/* Classe de Construção dos Poderes */
class Efeito{
  String idPoder = '';
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

  List modificadores = [];//List<dynamic>
  
  Map<String,dynamic> optDefault ={
    // Objeto de armazenamento de default
    "custo_base": -1,
    "acao": -1,
    "alcance": -1,
    "duracao":-1
  };

  
  
  // construtor
  Efeito(Map<String,dynamic> ObjPoder) {
    this._idEfeito = ObjPoder['e_id'];
    this.nomeDoPoder = ObjPoder['nomeDoPoder'];
    
    // Busca Atributos Base
    this._efeitoBase = ObjPoder['efeito'];
    this._custoBase = ObjPoder['custo_base'];
    this._acao = ObjPoder['acao'];
    this._alcance = ObjPoder['alcance'];
    this._duracao = ObjPoder['duracao'];
    this.tipo = ObjPoder['tipo'];

    /* para validações e calculo de custo
    o valores padrão devem ser armazenados */
    this.optDefault["custo_base"] = ObjPoder['custo_base'];
    this.optDefault["acao"] = ObjPoder['acao'];
    this.optDefault["alcance"] = ObjPoder['alcance'];
    this.optDefault["duracao"] = ObjPoder['duracao'];
  }

  addModificador(){

  }

  _processaCusto() async{
    /* Custo Básico */
    var valor_do_efeito = _custoBase * Graduacao;

    return (valor_do_efeito);
  }

  /********************************************
   * Metodos de Alteração de Atributos Padrão *
   ********************************************/

  alteraAction(vlrAction){
    int defaultAction = this.optDefault["acao"];
    switch (defaultAction) {
      
      case 1: // Ação Padrão
        /* Ação Padrão só pode chegar a Reação e  */
        if(vlrAction == 1 || vlrAction == 4){
          this._acao = vlrAction;
        }
        break;
      case 2: // Ação Movimento
        /* Ação de movimento podem ser jogadas 
        apenas para padrão */
        if(vlrAction == 1){
         this._acao = vlrAction;
        }
      case 3: // Ação Livre
        /* ação livre pode */
        if(vlrAction == 1 || vlrAction == 2 || vlrAction == 3){
          this._acao = vlrAction;
        }
        break;
      case 4: // Ação de Reação
        /* só não pode ser nenhuma */
        if(vlrAction == 1 || vlrAction == 2 || vlrAction == 3 || vlrAction == 4){
          this._acao = vlrAction;
        }
    }

    /* Alteração no custo */
    var valorCusto = this._acao - defaultAction;

    int custoPadrao = this.optDefault["custo_base"];
    this._custoBase = custoPadrao + valorCusto;
  }
  
  alteraRange(){

  }

  

  alteraDuracao(){

  }



  imprimeJSON() async{
  Object  efeitoDic =  {
            'nomeDoPoder': this.nomeDoPoder,
            'e_id': this._idEfeito,
            'efeito': this._efeitoBase,
            'acao': this._acao,
            'alcance': this._alcance,
            'duracao': this._duracao,
            'graduacao': this.Graduacao,
            'custo': this._custoBase,
            'pontos': await this._processaCusto(),
            'modificadores': this.modificadores,
            'tipo': this.tipo
        };
        return efeitoDic;
  }
}


class EfeitosOfensivos extends Efeito{

  EfeitosOfensivos(super.ObjPoder);
  int acerto = 0;
  int baseCD = 0;
}

class EfeitoDano extends EfeitosOfensivos{
  EfeitoDano(super.ObjPoder);
  efeitoDano(){
    this.baseCD = 15;
  }
  
}

class EfeitoOfensivo extends EfeitosOfensivos{
  EfeitoOfensivo(super.ObjPoder);
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
