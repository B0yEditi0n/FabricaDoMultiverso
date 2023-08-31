import numpy as nmp
class PericiaBase():
    nome = ''
    habiliBase = 0
    bonus = 0
    outrosBonus = 0
    treino = False
    def __init__(self, nome, habiliBase, treino = False):
        self.nome = nome
        self.habiliBase = habiliBase
        self.treino = treino

    def _calculaCusto(self):
        bonusDePericia = int(nmp.ceil( self.bonus / 2 ))
        # é necessáro instancia Habilidade base
        bonusDePericia += self.habiliBase 
        return ( bonusDePericia )
    
    def devolveDic(self):        
        dicRetorno = {
            "nome": self.nome,
            "bonus": self.habiliBase,
        }
        if self.treino == 'True' and self.bonus < 0:
            dicRetorno['total'] = 0
        else:
            dicRetorno['total'] = self.habiliBase + self.bonus + self.outrosBonus

        return dicRetorno            