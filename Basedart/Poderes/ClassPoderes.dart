/* Classe de Modificadores */
class Modificadores{
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

  var modificadores = List<Object>;
  
  // construtor
  efeito(String efeito){
    this._idEfeito = efeito;

    // Busca Atributos Base
    
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
  
}


class EfeitosOfensivos extends Efeito{
  int acerto = 0;
  int baseCD = 0;
}

class EfeitoDano extends EfeitosOfensivos{
  efeitoDano(){
    this.baseCD = 15;
  }
  
}

class EfeitoOfensivo extends EfeitosOfensivos{
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
