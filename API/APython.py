# Codigo Principal

from Modulos.Poderes import BibliotecaDeClasses as Efeito

# Dano
variavel = Efeito.EfeitoPadrao(
    tipo='Ataque', 
    nome='Dano', 
    acao=1, 
    alcance=1, 
    duracao=1
)
variavel.addCusto(1) # 1 por Graduação
variavel.addGrad(10) # 10 Graduações
variavel.addModificador(
    nome='a Distância',
    tipo='EG',
    custo=1,
    modEfeito=[{
        'atributo' : 'alcance',
        'novoValor' : '2'
    }]
    )
variavel.addModificador(
    nome='Concentração',
    tipo='EG',
    custo=1,
    modEfeito=[{
        'atributo' : 'acao',
        'novoValor' : '2'
    }]
    )
variavel.addModificador(
    nome='Critico',
    tipo='EF',
    custo=2,
    descricao='18-20'
    )
print(f'\nEfeito Final:\n{variavel.devolveDic()}')