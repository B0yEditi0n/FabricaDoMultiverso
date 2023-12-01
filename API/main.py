# microserviçops
# design pater IDE classes 
import sqlite3
import os
import flask
import flask_restful
import sys
import requests
import json

import importlib
from Modulos.Instanciadora import instanciadora

ficha = instanciadora()

api = flask.Flask(__name__)
postApi = flask_restful.Api(api)
@api.route('/')
def root(): 
    return(ficha.recebeJson())

@api.route('/nome/')
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

##########################
#    Sessão dos Poderes  #
##########################

@api.route('/poderes/')
def poderes():
    id     = flask.request.args.get('id') 
    efeito = flask.request.args.get('efeito') 
    grad   = flask.request.args.get('nivel')
    nome   = flask.request.args.get('nome')
    
    if id == None: # Poder Novo
        id = ficha.poderes.addPoder(efeito=efeito, nome=nome)

    if grad != None:
        ficha.poderes.addNivelPoder( id=id, nivel=grad,)
    return ficha.poderes.jPoderes[id]

@api.route('/delPoder/')
def deletePoder():    
    id = flask.request.args.get('id') 
    try:
        del ficha.poderes.jPoderes[id]    
    except:
        return('id inexistente')    

    return('deletado Com suecessos')
        
        


@api.route('/efeitos/')
def efeitos():
    return (ficha.poderes.EfeitoList())

@api.route('/modificadores/')
def modificadores():
    modID       = flask.request.args.get('idMod') 
    idPoder     = flask.request.args.get('idPoder')
    nivel       = flask.request.args.get('valor')
    if modID == None:
        return ficha.poderes.modList
    else:
        # try :
        ficha.poderes.addModify(id=idPoder, modID=modID, gradMod=nivel)
        # except:
            # return('id desconhecido')
        return(ficha.poderes.jPoderes[idPoder])


###########################################################


@api.route('/post/')
def postAPI():
    # post em banco de dados
    database = sqlite3.connect('Posts.db')
    table = database.cursor()

    APIurl = "https://fabrica-do-multiverso-default-rtdb.firebaseio.com/index"

    x = requests.get( APIurl + '.json')

    if x.status_code == 200:

        # checa se já existe algo postado
        table.execute(f"SELECT * FROM index_palyers WHERE '{ficha.nome}'")

        if len(table.fetchall()) <= 0:
            # Efetua o Post no Firebase
            name = requests.post(
                f'{APIurl}.json',
                json = ficha.recebeJson()
            )

            # Obtem a Reposta
            postResponse = json.loads(name.content)

            usuario = 'notImplemented'
            keyAcess = postResponse['name']
            
            # Escreve no database novo personagem
            instrucao = f"INSERT INTO index_palyers VALUES ( '{usuario}', '{ficha.nome}', '{keyAcess}')"
            table.execute(instrucao)

            database.commit()
            database.close()

            return (postResponse['name'])
        else:
            for r in table.fetchall():
                name = requests.put(
                    f'{APIurl}{r[2]}.json',
                    json = ficha.recebeJson()
                )

            # Obtem a Reposta
            postResponse = json.loads(name.content)
            return (postResponse['name'])
        

@api.route('/get/')
def getAPI():
    APIurl = "https://fabrica-do-multiverso-default-rtdb.firebaseio.com/index/"
    # diretorio = flask.request.args.get('dir')
    usuario = flask.request.args.get('user')
    if usuario != None:
        # Consulta SQL Lite       

        database = sqlite3.connect('Posts.db')
        table = database.cursor()

        instrucao = "SELECT *"
        instrucao += " FROM index_palyers"
        # if usuario != None:
            # instrucao += f"
            #  WHERE charactere = {usuario}"
        
        table.execute(f"SELECT * FROM index_palyers WHERE charactere = '{usuario}'")

        
        resultSelect = table.fetchall()
        
        database.commit()
        database.close()

        for r in resultSelect:
            x = requests.get( APIurl + r[2] + '.json')        
        LoadFicha = json.loads(x.content)

        ficha.LoadFicha(ficaCarregada=LoadFicha)
        return('sucesso')
        
    else:
        currentDir  = os.path.dirname(os.path.realpath(__file__))
        dirFicha  = os.path.join(os.sep, currentDir, 'baixados.json')
        fileFicha = json.loads(open(dirFicha, mode='r', encoding='utf-8').read())
        # ficha = instanciadora(new=False, ficha=fileFicha)
        return fileFicha

if __name__ == '__main__':
    api.run(debug=True)
