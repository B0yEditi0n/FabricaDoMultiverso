/* teste de poderes */
import 'Poderes/ClassPoderes.dart' as poderes;
import 'dart:convert';

main(){
  var poder = new poderes.Efeito(
    '001',
    'Super Raio'
  );
  poder.carregaJson();
  
  print(poder.devolveDic());

}
