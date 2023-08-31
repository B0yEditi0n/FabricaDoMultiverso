import json

# Módulo de Pericias 
from Pericias import PericiaClass as Pericia

ficha = {}
# Instancia Habilidades 
class instanciadora():
    jHabili = {}
    jPericias = []
    def __init__(self, new = True):
        # Instaciar do Zero
        if new:
            self.jHabili = json.loads(open('./Habilidades/Habilidades.json', 'r').read())
            self.montaPericias()

        # Apartir de um arquivo
        
    def Habilidades(self):
        # self.jHabili = open('FabricaDoMultiverso/API/Modulos/Habilidades/Habilidades.json', 'r').read()
        pass
    
    def montaPericias(self):
        #  
        padraoPericias = json.loads(open('./Pericias/PericiasFixo.json', 'r').read())
        for id in padraoPericias:
            # IDs de pericia
            nome = padraoPericias[id]['nome']
            habilidade = self.jHabili[padraoPericias[id]['habilidade']]['valor']
            treino = padraoPericias[id]['treinamento']
            p = Pericia.PericiaBase(nome=nome, habiliBase=habilidade, treino=treino)
            self.jPericias.append(p.devolveDic())
        
        pass

    def recebeJson():
        pass
    
    # def readHability(self):
    #     self.


intancie = instanciadora()

print ( intancie.jPericias[1] )