#Importa el módulo que nos permite trabajar con bases de datos
import sqlite3
#se hace la conección a la base de datos indicada y si esta no exite tambien la crea
conexion= sqlite3.connect("BaseDeDatos2")
#nos permite hacer uso de sql
puntero=conexion.cursor()

#Se crea la tabla con el nombre mascotas con las columnas ID,NOMBRE Y ESPECIE con su  tipo de dato
puntero.execute("CREATE TABLE MASCOTAS(ID INTEGER,NOMBRE VARCHAR(20),ESPECIE VARCHAR(20))")
#inserta una fila en la tabla mascota conlos valores ID=1,Nombre=Spaguetti y ESPECIE=Gato
puntero.execute("INSERT INTO MASCOTAS VALUES(1,'Spaguetti','Gato')")

#-------------------------Haciendo una consulta--------------------------------------------
#se hace un consulta de la tabla mascota (Se indica que se quiere ver como resultado)
puntero.execute("SELECT * FROM MASCOTAS")
#puntero.fetchall() contiene la ultima consulta realizada y esta se asigna a resultado
resultado=puntero.fetchall()
#Se imprime la consulta realizada que es la tabla mascota
print(resultado)

##########insertar varios datos en una sola instrucción##########
#se crea la variable que contiene nustros datos a insertar
variasMascotas=[
	(2,'Abondiga','Cuyo'),
	(3,'Odin', 'Perro'),
	(4,'Luna','Tortuga'),
	(5,'Jerry','Perro')
]
#Se insertan varias filas con execute many, poniendo como valores (?,?,?) y al termino de la
# sentencia sql ,y la variable que contiene nuestros datos. Cada ? representa el valor de una columna
puntero.executemany("INSERT INTO MASCOTAS VALUES(?,?,?)",variasMascotas)

#--------consulta como la vista anteriormente-----------------------------
puntero.execute("SELECT * FROM MASCOTAS")
resultado=puntero.fetchall()
print("Se muestra mi tabla con las nuevas inserciones")
#Se hace un ciclo para que imprima fila por fila y no todas seguidas
for i in resultado:
	print(i)
#################Modificar un dato de una tabla#############

#de la tabla MASCOTAS se coloca ESPECIE=HAMSTER en la fila o filas que contengas por nombre Abondiga
puntero.execute("UPDATE MASCOTAS SET ESPECIE='HAMSTER' WHERE NOMBRE='Abondiga'")
#---consulta pero se agrega where para solo mostrar las filas con el nombre Abondiga
puntero.execute("SELECT * FROM MASCOTAS WHERE NOMBRE='Abondiga'")
resultado=puntero.fetchall()
print("Se imprime la fila solicitada")
print(resultado)
################Eliminar filas de mi tabla#################

#En la tabla MASCOTAS se eliminan las filas donde ESPECIE sea igual a perro
puntero.execute("DELETE FROM MASCOTAS WHERE ESPECIE='Perro'")

#--------consulta de la tabla MASCOTAS---------------------------------
puntero.execute("SELECT * FROM MASCOTAS")
resultado=puntero.fetchall()
print("Tabla mascotas despues de eliminar las filas que tengan perro en la columna especie")
for i in resultado:
	print(i)
#####################TABLA CON RESTRICCIONES################ 
'''-------------Código que manda error---------------------------------------
puntero.execute("CREATE TABLE CITAS(ID INTEGER PRIMARY KEY AUTOINCREMENT,NOMBRE VARCHAR(20))")

variasCitas=[
	('Albondiga'),
	('Luna'),
	('Jerry'),
	('Spaguetti')
]
puntero.executemany("INSERT INTO CITAS VALUES(NULL,?)",variasCitas)

:'( executemany con 2 valores donde uno de ellos es NULL no fuciona
-----------------------------------------------------------------------------------------'''

#---------------Código que funciona :D-----------------------------------------------------
#Se crea la tabla Citas y a ID se le agrega PRIMARY KEY que indica que este valor es único 
#y no nulo
puntero.execute("CREATE TABLE CITAS(ID INTEGER PRIMARY KEY ,NOMBRE VARCHAR(20),EDAD INTEGER)")

#se crea la variable que contiene nustros datos a insertar
variasCitas=[
	('Albondiga',1),
	('Luna',12),
	('Jerry',10),
	('Spaguetti',5)
]
#Se insertan varias filas, nota que en donde debería ir ID se tiene NULL y el resto sigue poniendo
#como ? y la variable de los datos al finalizar la sentencia SQL
puntero.executemany("INSERT INTO CITAS VALUES(NULL,?,?)",variasCitas)

#----------Consulta de los valores insertados--------------------------------------
#Nota como id se pone automaticamente y va incrementando de uno en uno 
puntero.execute("SELECT * FROM CITAS")
resultado=puntero.fetchall()
print("tabla Citas despues de insertar varios datos")
for i in resultado:
	print(i)



conexion.commit()
conexion.close()