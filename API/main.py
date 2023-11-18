
import os
import flask
import sys

import importlib 
from Modulos.Instanciadora import instanciadora

ficha = instanciadora()

api = flask.Flask(__name__)

# @api.route('/')
# def root():
#     pass
    

@api.route('/habilidades/')
def habilidades():
    habilidade = flask.request.args.get('ID')
    bonus      = flask.request.args.get('valor')
    
    ficha.bonusHabilidades(
        Habilistr = habilidade, 
        bonus     = bonus
    )
    return(ficha.jHabili)

if __name__ == '__main__':
    api.run(debug=False)