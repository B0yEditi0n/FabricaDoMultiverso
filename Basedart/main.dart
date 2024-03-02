import 'Poderes/ClassPoderes.dart' as efeitosList;

class instanciadoraDePoderes{
  
}

class Instanciadora{
  var nomePersonagem = "";
  var np = 10;
  var pontosPorLevel = 15;


  Instanciadora(){

  }
  addPoderes() async{
    var poderes = new efeitosList.Efeito('E026', 'Telecinese');
    await poderes.carregaBase();
    poderes.Graduacao = 5;
    print(await poderes.devolveDic());
  }
}


void main() {
  final controladora = new Instanciadora();
  controladora.addPoderes();
}