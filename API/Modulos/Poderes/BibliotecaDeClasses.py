class Modificador():
    nome  = ''
    custo = 0
    parcial = 0
    descricao = ''
    fixo = False
    def processarDic(self):
        modDic = {
            'nome': self.nome,
            'descricao': self.descricao
        }
        if (self.fixo):
            modDic['custoGrad'] = 0
            modDic['custoFixo'] = self.custo
            
        else:
            modDic['custoGrad'] = self.custo
            modDic['custoFixo'] = 0
        
        modDic['parcial'] = self.parcial

        return modDic
        
      

class EfeitoPadrao():
    nome = ''
    tipo = ''


    acao = 0 
    # 0 - Nenhuma
    # 1 - Padrao
    # 2 - Movimento
    # 3 - Livre
    # 4 - Reação


    alcance = 0
    # 0 - Pessoal
    # 1 - Perto
    # 2 - A Distância
    # 3 - Percepção
    # 4 - Graduação


    duracao = 0
    # 0 - Permente
    # 1 - Instantanêo
    # 2 - Concentração
    # 3 - Sustentado
    # 4 - Contínuo 

    graduacao = 0
    custoPorGrad = 0

    modificadores = []

    def __init__(self, nome, tipo, acao, alcance, duracao):
        self.nome    = nome
        self.tipo    = tipo
        self.acao    = acao
        self.alcance = alcance
        self.duracao = duracao

    def addCusto(self, custo):
        self.custoPorGrad = custo

    def addGrad(self, grad):
        self.graduacao = grad

    def addModificador(self, tipo, nome, custo, modEfeito={}, parcial=None, descricao=''):
        modificador = Modificador()       
        modificador.nome = nome
        modificador.custo = custo
        modificador.parcial = parcial
        modificador.descricao = descricao
        # tipo:
        # EG - Extra por Graduação
        # EF - Extra Fixo
        # FG - Falha por Graduação
        # FF - Falha Fixa        
        tipo = tipo.upper()
        if (tipo == 'EG' or tipo == 'FG'):
            modificador.fixo = False
        elif (tipo == 'EF' or tipo == 'FF'):
            modificador.fixo = True

        self.modificaFuncionamento(modEfeito)
        self.modificadores.append(modificador.processarDic())


    def modificaFuncionamento(self, modEfeito):
        # Modificação de Efeito
        # [{ 
        #   atributo = 'tipo, acao, alcance, duracao'
        #   novoValor = 'Perto, A Distância'
        #  }]
        for i in modEfeito:            
            if (i['atributo'] == 'acao'):
                self.acao = i['novoValor']
            elif (i['atributo'] == 'alcance'):
                self.alcance = i['novoValor']
            elif (i['atributo'] == 'duracao'):
                self.duracao = i['novoValor']
    # Utilidades de Classe
    def devolveDic(self):
        efeitoDic = {
            'nomeEfeito': self.nome,
            'acao': self.acao,
            'alcance': self.alcance,
            'duracao': self.duracao,
            'graduacao': self.graduacao,
            'custo': self._processaCusto()
        }
        if (len(self.modificadores) > 0):
            efeitoDic['modificadores'] = []
            for i in range(0, len(self.modificadores)):
                
                efeitoDic['modificadores'].append(self.modificadores[i])

        return (efeitoDic)
    
    def _processaCusto(self):
        #Graduação x ( Custo + Modificadores)
        custoGrad = self.custoPorGrad
        custoFixo = 0
        for i in self.modificadores:            
            if (i['parcial'] != None):
                custoFixo += i['custoGrad'] * i['parcial']
            else:
                custoGrad += i['custoGrad']
                custoFixo += i['custoFixo']

        if (custoGrad > 0):
            custoFinal = ( custoGrad * self.graduacao ) + custoFixo
        else:
            # lembrese existe um limite de falhas
            # por hora isso não será implmentado
            custoFinal = ( self.graduacao / ( custoGrad + 1 ) ) + custoFixo
        
        # independente da conta nada pode custar 0
        if(custoFinal <= 0):
            custoFinal = 1
        return ( custoFinal )


class Ofensive(EfeitoPadrao):
    CD = 10

    priCondit = ''
    segCondit = ''
    terCondit = ''

    def __init__(self, nome, tipo, acao, alcance, duracao):
        super().__init__(
            nome = nome,
            tipo = tipo,
            acao = acao,
            alcance = alcance,
            duracao = duracao
        )
    def calculaCD(self):
        if super().nome == 'Dano':
            self.CD = 15
        pass
    
    # Exclusivo de Aflição
    def addCondition(self, prim, seg, ter):
        self.priCondit = prim
        self.segCondit = seg
        self.terCondit = ter
     
    def devolveDic(self):
        efeitoDic = super().devolveDic()

        efeitoDic['condição'] = []
        efeitoDic['condição']['primeira'] = self.priCondit
        efeitoDic['condição']['segunda'] = self.segCondit
        efeitoDic['condição']['terceira'] = self.terCondit


class MultiArranjos():
    listEfeito = []

    # tipo 1 - Aranjo
    # tipo 2 - Recipiente ou Efeitos Ligados
    # tipo Genérico Varíavel
    tipo = 1

    def retornaLista():
        pass
    def extraiEfeito():
        pass
    def calculaCusto(self, tipo=1):
        
        if tipo == 1:
            pass
        else:
            pass
        pass

    def addPoder(self, json):
        # self.listEfeito.append(json)
        pass
