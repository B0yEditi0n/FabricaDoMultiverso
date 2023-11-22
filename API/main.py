import os
import flask 
import sys
import requests

import importlib
from Modulos.Instanciadora import instanciadora

ficha = instanciadora()

api = flask.Flask(__name__)
@api.route('/')
def root(): 
    return(ficha.recebeJson())

@api.route('/nome')
def defineNome():
    nomeChar = flask.request.args.get('nome')
    ficha.nome = nomeChar
    return f'aceito {nomeChar}'

@api.route('/habilidades/')
def habilidades():
    habilidade = flask.request.args.get('ID')
    bonus      = flask.request.args.get('valor')
    
    if habilidade == None:
        return(ficha.jHabili)
    else:    
        ficha.bonusHabilidades(
            Habilistr = habilidade, 
            bonus     = bonus
        )
        return ficha.jHabili

@api.route('/pericias/')
def pericias():
    
    IDPeri = flask.request.args.get('ID') 
    bonus  = flask.request.args.get('valor')

    if IDPeri == None:
        return(ficha.pericia.jPericias)
    else:
        ficha.pericia.addBonusPericia(
            id    = IDPeri,
            bonus = int(bonus)      
        )
        return ficha.pericia.jPericias[IDPeri]

@api.route('/post/')
def postAPI():
    APIurl = "https://fabrica-do-multiverso-default-rtdb.firebaseio.com/index"
    x = requests.get( APIurl + '.json')
    if x.status_code == 200:
        name = requests.post(
            f'{APIurl}.json',
            json = ficha.recebeJson()
                      )
        print (name)
        return (f'postado!\n {ficha.recebeJson()}')
    

if __name__ == '__main__':
    api.run(debug=True)
