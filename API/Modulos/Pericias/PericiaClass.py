import math
class PericiaBase():
    nome = ''
    habiliBase = 0
    bonus = 0
    outrosBonus = 0
    treino = False
    habiliBonus = 0

    def __init__(self, nome, habiliBase, habiliBonus, treino = False):
        self.nome = nome
        self.habiliBase = habiliBase
        self.habiliBonus = habiliBonus
        self.treino = treino

    def _calculaCusto(self):
        bonusDePericia = int(math.ceil( self.bonus / 2 ))
        # é necessáro instancia Habilidade base
        return ( bonusDePericia )

    def devolveDic(self):
        dicRetorno = {
            "nome": self.nome,
            "bonus": self.bonus,
            "habilidade": self.habiliBase,
            "treino": self.treino
        }
        if self.treino == 'True' and self.bonus < 0:
            dicRetorno['total'] = 0
        else:
            dicRetorno['total'] = self.habiliBonus + self.bonus + self.outrosBonus
            dicRetorno['custo'] = self._calculaCusto()

        return ( dicRetorno )