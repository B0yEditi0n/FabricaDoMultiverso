import json

# Módulo de Pericias 
from Pericias import PericiaClass as Pericia

ficha = {}
# Instanciadora de Pericias
class intanciaPerica():
    jPericias = {}
    jHabili = {}

    def __init__(self, jHabili):
        self.jHabili = jHabili

    def montaPericias(self):
        # adiciona pericias padrão
        padraoPericias = json.loads(open('./Pericias/PericiasFixo.json', 'r').read())

        for id in padraoPericias:
            # IDs de pericia
            nome = padraoPericias[id]['nome']
            habiliStr = padraoPericias[id]['habilidade']
            habiliInt = self.jHabili[habiliStr]['valor']
            treino = padraoPericias[id]['treinamento']
            p = Pericia.PericiaBase(nome=nome, habiliBase=habiliStr, habiliBonus=habiliInt, treino=treino)
            self.jPericias[id] = p.devolveDic()

    def modificaPericia(self, id):
        pass

    def addPericia(self, nome, habilidade, treino):
        valorHabili = self.jHabili[habilidade]['valor']
        p = Pericia.PericiaBase(nome=nome, habiliBase=habilidade, habiliBonus=valorHabili, treino=treino)
        
        # adiciona em um novo indice
        id = f'P0{ len(self.jPericias) + 1 }'
        print('addicionado, indice ', id)
        self.jPericias[id] = p.devolveDic()

    def addBonusPericia(self, id, bonus):
        # desmantelar elemento
        nome = self.jPericias[id]['nome']
        # bonus = self.jPericias[id]['bonus']
        self.jPericias[id]['habilidade']
        habiliBase = self.jPericias[id]['habilidade']
        print(habiliBase)
        habiliBonus = self.jHabili[habiliBase]['valor']
        # print(habiliBase)
        treino = self.jPericias[id]['treino']

        # Criação
        p = Pericia.PericiaBase(nome=nome, habiliBase= habiliBase, habiliBonus=habiliBonus, treino=treino)
        p.bonus = bonus

        self.jPericias[id] = p.devolveDic()
        



# Instanciadora Genérica 
class instanciadora():
    jHabili = {}
    pericia = ()
    def __init__(self, new = True):
        # Instaciar do Zero
        if new:            
            self.jHabili = json.loads(open('./Habilidades/Habilidades.json', 'r').read())
            self.pericia = intanciaPerica(jHabili = self.jHabili)
            self.pericia.montaPericias()

        # Apartir de um arquivo
        
    def Habilidades(self):
        pass

    def recebeJson():
        pass


intancie = instanciadora()
# intancie.montaPericias()
intancie.pericia.addPericia(nome='Especialidade: Magia', habilidade='INT', treino=True)
intancie.pericia.addBonusPericia('P014', 10)
print ( intancie.pericia.jPericias['P014'] )
