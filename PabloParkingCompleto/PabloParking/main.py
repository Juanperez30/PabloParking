from flask import Flask, render_template,url_for,request,flash, redirect
from flaskext.mysql import MySQL


app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '1234'
app.config['MYSQL_DATABASE_DB'] = 'parqueadero'


mysql = MySQL()
mysql.init_app(app)



@app.route ('/')
def inicio():
    return render_template('Bienvenida.html')

@app.route ('/nueva_pagina')
def nuevapagina():
    return render_template('Bienvenida.html')



@app.route('/salevehiculo/<placa>')
def eliminar(placa):
    cursor = mysql.get_db().cursor()
    cursor.execute("DELETE FROM vehiculo WHERE placa = %s;",(placa))
    mysql.get_db().commit()
    return redirect(url_for('nuevapagina'))

@app.route('/consultas')
def consultas():
    return render_template('consultas.html')


@app.route('/asignarEdicion/<cedula>')
def asignarEdicion(cedula):
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM clientes WHERE cedula = %s",(cedula))
    datos = cursor.fetchall()
    return render_template('editarCliente.html', cliente = datos[0])

@app.route('/eliminado/<placa>', methods=['POST'])
def eliminado(placa):
    if request.method == 'POST':
        placa = request.form['pk']
        cursor = mysql.get_db().cursor()
        cursor.execute(
        "UPDATE vehiculo SET horaSalida = NOW() Where placa = '%s'; DELETE FROM vehiculo WHERE placa = '%s';")

@app.route ('/muestravehiculoelim')
def muestravehiculoelim():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM vehiculo")
    datos = cursor.fetchall()
    return render_template('tablavehiculoelim.html', vehiculo = datos)


@app.route ('/muestravehiculo')
def muestravehiculo():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM vehiculo")
    datos = cursor.fetchall()
    return render_template('tablavehiculo.html', vehiculo = datos)


@app.route ('/disponibles')
def disponibles():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT tipoPuesto, COUNT(*) AS 'Cantidad de Puestos' FROM puesto WHERE ocupado = 0 GROUP BY tipoPuesto ")
    datos = cursor.fetchall()
    return render_template('tablavehiculodisp.html', puesto = datos)


@app.route ('/clientes')
def clientes():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM clientes")
    datos = cursor.fetchall()
    return render_template('tablaclientes.html', clientes = datos)


@app.route ('/historial')
def historial():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM factura")
    datos = cursor.fetchall()
    return render_template('tablahistorial.html', facturas = datos)

@app.route('/insertarcliente', methods=['POST'])
def registracliente():
    if request.method == 'POST':
        varNombre = request.form['nomb']
        varApellido = request.form['apell']
        varID = request.form['iden']
        varTel = request.form['tel']
        varVeh = request.form['pl']
        cursor = mysql.get_db().cursor()
        cursor.execute("INSERT INTO clientes VALUES(%s, %s, %s, %s, %s, 0)", (varNombre, varApellido, varID, varTel, varVeh))
        mysql.get_db().commit()
        return redirect(url_for('nuevapagina'))

@app.route('/formreg')
def registro():
    return render_template('creaCliente.html')


@app.route('/insertarvehiculo', methods=['POST'])
def registravehiculo():
    if request.method == 'POST':
        varPlaca = request.form['pla']
        varColor = request.form['col']
        varMod = request.form['mod']
        varTip = request.form['tip']
        varPue = request.form['pue']
        varCas = request.form['cas']
        cursor = mysql.get_db().cursor()
        cursor.execute("INSERT INTO vehiculo (horaEntrada, placa, color, modelo, idtipo_Vehiculo, puestoAsignado, casilleroAsignado) VALUES(NOW(), %s, %s, %s, %s,%s,%s)", (varPlaca, varColor, varMod, varTip, varPue, varCas))
        mysql.get_db().commit()
        return redirect(url_for('nuevapagina'))

@app.route('/formregveh')
def registroVehiculo():
    return render_template('creaVehiculo.html')

@app.route('/insertarlavado', methods=['POST'])
def registralavado():
    if request.method == 'POST':
        varDoc = request.form['doc']
        aux = request.form['doc']
        descue = request.form['doc']
        cursor = mysql.get_db().cursor()
        cursor.execute("INSERT INTO lavado (precio,fecha,descuento, clientes_documento,precioFinal) VALUES (20000, CURDATE(), descu(%s), %s, preciofinal(%s));", (varDoc,aux,descue))
        mysql.get_db().commit()
        return redirect(url_for('nuevapagina'))

@app.route('/formreglav')
def registroLavadero():
    return render_template('creaLavado.html')



if __name__ == '__main__':
    app.run(debug=True, port = 3000)
