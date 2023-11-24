import json
import os
import sys

# Módulo de Pericias 
# import API.Modulos.Pericias

from .Pericias import PericiaClass as Pericia
from .Poderes import BibliotecaDeClasses as Efeito

ficha = {}

currentDir  = os.path.dirname(os.path.realpath(__file__))
dirHabilir  = os.path.join(os.sep, currentDir, 'Habilidades', 'Habilidades.json')   
dirPericias = os.path.join(os.sep, currentDir, 'Pericias', 'PericiasFixo.json') 
dirEfeito   = os.path.join(os.sep, currentDir, 'Poderes', 'Efeitos.json') 
# Instanciadora de Poderes
class instaciaPoderes():
    jPoderes = {}
    
    try:
        efeitosList = json.loads(open(dirEfeito, mode="r", encoding="utf-8").read())
    except FileNotFoundError:
        print('erro')

    def addPoder(self, efeito, nome=''):
        
        efeitoBase = self.efeitosList[efeito]
        poder = Efeito.EfeitoPadrao(
            nome=efeito,
            acao=efeitoBase['acao'], 
            alcance=efeitoBase['alcance'],
            duracao=efeitoBase['duracao'],
            tipo=efeitoBase['tipo'])
        
        id = f'E{len(self.jPoderes) + 1}'
        print ( 'Adicionado Poder de ID:', id )
        self.jPoderes[id] = poder.devolveDic()
        self.jPoderes[id]['nome'] = nome
    def addModify():
        pass

# Instanciadora de Pericias
class intanciaPerica():
    
    jPericias = {}
    jHabili = {}

    def __init__(self, jHabili):
        self.jHabili = jHabili

    def montaPericias(self):
        # adiciona pericias padrão
        padraoPericias = json.loads(open(dirPericias, mode='r', encoding='utf-8').read())

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
        habilidade.upper()
        valorHabili = self.jHabili[habilidade]['valor']
        p = Pericia.PericiaBase(nome=nome, habiliBase=habilidade, habiliBonus=valorHabili, treino=treino)
        
        # adiciona em um novo indice
        id = f'P0{ len(self.jPericias) + 1 }'
        print('addicionado, indice ', id)
        self.jPericias[id] = p.devolveDic()

    def addBonusPericia(self, id, bonus):
        # desmantelar elemento
        nome = self.jPericias[id]['nome']
        self.jPericias[id]['bonus'] = bonus
        self.jPericias[id]['habilidade']
        habiliBase = self.jPericias[id]['habilidade']
        habiliBonus = self.jHabili[habiliBase]['valor']
        
        treino = self.jPericias[id]['treino']

        # Criação
        p = Pericia.PericiaBase(nome=nome, habiliBase= habiliBase, habiliBonus=habiliBonus, treino=treino)
        p.bonus = bonus

        self.jPericias[id] = p.devolveDic()
        



# Instanciadora Genérica 
class instanciadora():
    jHabili = {}
    pericia = ()
    jPoderes = {}
    nome = ""
    def __init__(self, new = False, ficha={}):
        # Instaciar do Zero
        if new == False:
            
            self.jHabili = json.loads(open(dirHabilir, 'r', encoding="utf-8").read())
            self.pericia = intanciaPerica(jHabili = self.jHabili)
            self.pericia.montaPericias()
        else :
            self.jHabili = ficha['habilidades']
            self.pericia = intanciaPerica(jHabili = self.jHabili)
            self.pericia.jPericias = ficha['habilidades']
            self.nome = ficha['name']
        
    def bonusHabilidades(self, Habilistr, bonus):
        Habilistr.upper()
        self.jHabili[Habilistr]['valor'] = int(bonus)

    def recebeJson(self):
        ficha = { 
            "name": self.nome,
            "habilidades": self.jHabili,
            "pericias": self.pericia.jPericias

        }
        return ficha

# intancie = instanciadora()

# # intancie.addPoder(nome='Condicionar', efeito='Aflição')
# intancie.bonusHabilidades('FOR', 3)
# print(intancie.jHabili)
# intancie.pericia.addBonusPericia('P002', 2)
# print (intancie.pericia.jPericias)
