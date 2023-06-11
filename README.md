	# Lambda Calculus

EL proyecto consiste en implementar un pequeño interprete de λ-càlcul llamado AChurch.

## Instalación

Para utilizar este Lambda Calculus se necessita los siguientes prerequisitos:

### Antrl4 para Python
Puedes utilizar las siguientes comandas para instalar antlr4 en ubuntu:
```bash
pip install antlr4-toolssudo apt update 
antlr4
pip install antlr4-python3-runtime
```
### Python3.10 o posterior

El programa esta implementado con pyhton y utilizamos @dataclass por lo se necessita python3.10 o posterior

Puedes utilizar las siguientes comandas para instalar python3.10 en ubuntu:

```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update 
sudo apt install python3.10
```
### Telegram-bot
Puedes utilizar las siguientes comandas para instalar telegram-bot en ubuntu(en este caso necesitaremos la version 13.5):
```bash
pip install python-telegram-bot==13.5
```
### Pydot
Para construir árboles de expresiones del cálculo lambda utilizando la biblioteca pydot

```bash
pip install pydot
sudo apt install graphviz
```
### Crear el telegram bot:

¿Cómo creo un bot? Crear bots de Telegram es súper fácil, pero necesitarás al menos algunos conocimientos de programación informática

La creación de un bot se agiliza gracias a la API de bots de Telegram, que proporciona las herramientas y el marco necesarios para integrar tu código. Para empezar, envía un mensaje a [@BotFather](https://t.me/botfather) en Telegram para registrar tu bot y recibir su token de autenticación.

El token de tu bot es su identificador único - guárdalo en un lugar seguro, y sólo compártelo con personas que necesiten acceso directo al bot. Todos los que tengan tu token tendrán control total sobre tu bot.

Una vez que tengas el telegram bot, tendras que guardar el token recibido por @BotFather en un arxivo txt llamado "token.txt".
## Compilacion
Para ejecutar el programa tendras que generar ciertos archivos con las siguientes comandas:
```bash
antlr4 -Dlanguage=Python3 -no-listener exprs.g4
antlr4 -Dlanguage=Python3 -no-listener -visitor exprs.g4
```
Siendo 'exprs.g4' la gramática de nuestro lambda calculo.

## Características
Este programa esta implementado para poder interactuar con los bots del telegram y utilizar todas las funciones implementadas como las siguientes:


### El visitador
Dada una expression de lambda calculo de esta manera (λy.x(yz))(ab) es capaz de convertir un arbol semantico que representa la expression -> ((λy.(x(yz)))(ab))

### Avaluador
Permite evaluar una expresión de cálculo lambda siguiendo la estrategia de reducción normal. Durante el proceso deevaluación, la función debe mostrar 
		las reglas que se aplican, como las reducciones β y las conversiones α, para llegar al objetivo final. En particular, el
		objetivo principal es aplicar las reducciones β a las aplicaciones en las que el primer término sigue una abstracción.
ejemplo:
```bash
? (λy.x(yz))(ab)
Arbre:
((λy.(x(yz)))(ab))
β-reducció:
((λy.(x(yz)))(ab)) → (x((ab)z))
Resultat:
(x((ab)z))
```
### Macros
Los macros son nombres que comienza por una letras mayusculas y podemos guarda las expressiones lambda en estos macros.ejemplo:
```
? TRUE≡λx.λy.x
TRUE ≡ (λx.(λy.x))
? FALSE≡λx.λy.y
TRUE ≡ (λx.(λy.x))
FALSE ≡ (λx.(λy.y))
? NOT≡λa.a(λb.λc.c)(λd.λe.d)
TRUE ≡ (λx.(λy.x))
FALSE ≡ (λx.(λy.y))
NOT ≡ (λa.((a(λb.(λc.c)))(λd.(λe.d))))
```
Tambien permite evaluar macros

```
? NOT TRUE
Arbre:
((λa.((a(λb.(λc.c)))(λd.(λe.d))))(λx.(λy.x)))
β-reducció:
((λa.((a(λb.(λc.c)))(λd.(λe.d))))(λx.(λy.x))) → (((λx.(λy.x))(λb.(λc.c)))(λd.(λe.d)))
β-reducció:
((λx.(λy.x))(λb.(λc.c))) → (λy.(λb.(λc.c)))
β-reducció:
((λy.(λb.(λc.c)))(λd.(λe.d))) → (λb.(λc.c))
Resultat:
(λb.(λc.c))
```

### Macros con notacion infija
Los macros con notacion infijas son los macros que cuyos nombres seran simbolos no alfabeticos.

```
? N2≡λs.λz.s(s(z))
N2 ≡ (λs.(λz.(s(sz))))
? N3≡λs.λz.s(s(s(z)))
N2 ≡ (λs.(λz.(s(sz))))
N3 ≡ (λs.(λz.(s(s(sz)))))
? +≡λp.λq.λx.λy.(px(qxy))
N2 ≡ (λs.(λz.(s(sz))))
N3 ≡ (λs.(λz.(s(s(sz)))))
+ ≡ (λp.(λq.(λx.(λy.((px)((qx)y))))))
```
Evaluacion:
```
? N2+N3
Arbre:
(((λp.(λq.(λx.(λy.((px)((qx)y))))))(λs.(λz.(s(sz)))))(λs.(λz.(s(s(sz))))))
β-reducció:
((λp.(λq.(λx.(λy.((px)((qx)y))))))(λs.(λz.(s(sz))))) → (λq.(λx.(λy.(((λs.(λz.(s(sz))))x)((qx)y)))))
β-reducció:
((λq.(λx.(λy.(((λs.(λz.(s(sz))))x)((qx)y)))))(λs.(λz.(s(s(sz)))))) → (λx.(λy.(((λs.(λz.(s(sz))))x)(((λs.(λz.(s(s(sz)))))x)y))))
β-reducció:
((λs.(λz.(s(sz))))x) → (λz.(x(xz)))
β-reducció:
((λz.(x(xz)))(((λs.(λz.(s(s(sz)))))x)y)) → (x(x(((λs.(λz.(s(s(sz)))))x)y)))
β-reducció:
((λs.(λz.(s(s(sz)))))x) → (λz.(x(x(xz))))
β-reducció:
((λz.(x(x(xz))))y) → (x(x(xy)))
Resultat:
(λx.(λy.(x(x(x(x(xy)))))))
```
### AChurch a Telegram
Para utilizar el bot solo tendras que ejecutar el programa de bot de esta manera:
```
python3 bot.py
```
Ahora podras utilizar el bot eb telegram. En el bot podras utilizar las siguentes comandas: /start, /help , / author, /macros.

