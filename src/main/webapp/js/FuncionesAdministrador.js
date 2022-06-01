function EntregableASociado(id_evento, id_parametro, estado, id, lista) {
    document.getElementById('alertCorrectEntr'+id_evento).style.display = 'none';
    document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
    if (MaximoPorcentajeEntr(lista,id_evento) <= 100) {
        console.log(document.getElementById('idhidden' + id_parametro+id_evento).value);
        if (document.getElementById('idhidden' + id_parametro+id_evento).value == "0") {
                console.log("crear");
            if (document.getElementById("check" + id_parametro+id_evento).checked) {
                CrearEntregableASociado(id_evento, id_parametro, estado, id);
            }
        } else if (document.getElementById('idhidden' + id_parametro+id_evento).value == "1") {
            if (document.getElementById("check" + id_parametro+id_evento).checked) {
                console.log("editar");
                EditarEntregableASociado(id_evento, id_parametro, estado, id);
            } else {
                console.log("eliminar");
                EliminarEntregableASociado(id_evento, id_parametro, estado, id);
            }
        }
    } else {
        document.getElementById('alertCorrectEntr'+id_evento).style.display = 'none';
        document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'block';
        document.getElementById('menerror'+id_evento).innerHTML = "";
        document.getElementById('menerror'+id_evento).innerHTML = "El porcentaje total de los entregables supera el 100%";
    }
}

function CrearEntregableASociado(id_evento, id_parametro, estado, id) {
    $.ajax({
        type: "GET",
        url: '/Acero/GuardarEntregableAsociados?id_evento=' + id_evento + '&id_parametro=' + id_parametro + '&porcentaje=' + document.getElementById("textporcentaje" + id_parametro+id_evento).value,
        success: function (data) {
            console.log(data);
            if (data == '1') {
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('mencorrecto'+id_evento).innerHTML = "";
                document.getElementById('mencorrecto'+id_evento).innerHTML = "Se asigno correctamente el entregable al reto";
            } else if (data == "3") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se asigno correctamente el entregable al reto";
            } else if (data == "2") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se asigno correctamente el entregable al reto, eror de base de datos";
            }
            document.getElementById('idhidden' + id_parametro+id_evento).value = "1";
        },
        error: function (data) {
            alert('error');
        }
    });
}

function EditarEntregableASociado(id_evento, id_parametro, estado, id) {
    $.ajax({
        type: "GET",
        url: '/Acero/ActualizarEntregableAsociado?id_evento=' + id_evento + '&id_parametro=' + id_parametro + '&porcentaje=' + document.getElementById("textporcentaje" + id_parametro+id_evento).value,
        success: function (data) {
            if (data == "1") {
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('mencorrecto'+id_evento).innerHTML = "";
                document.getElementById('mencorrecto'+id_evento).innerHTML = "Se actualizo correctamente el entregable al reto";
            } else if (data == "3") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se actualizo correctamente el entregable al reto";
            } else if (data == "2") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se actualizo correctamente el entregable al reto, eror de base de datos";
            }
            document.getElementById('idhidden' + id_parametro+id_evento).value = "1";
        },
        error: function (data) {
            alert('error');
        }
    });
}

function EliminarEntregableASociado(id_evento, id_parametro, estado, id) {
   $.ajax({
        type: "GET",
        url: '/Acero/EliminarEntregableAsociados?id_parametro=' + id_parametro + '&id_evento=' + id_evento,
        success: function (data) {
            if (data == '1') {
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('mencorrecto'+id_evento).innerHTML = "";
                document.getElementById('mencorrecto'+id_evento).innerHTML = "Se elimino correctamente el entregable al reto";
            } else if (data == "3") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se elimino correctamente el entregable al reto";
            } else if (data == "2") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se elimino correctamente el entregable al reto, posiblemente ya hay documentacion cargada de este entregable";
            }
            document.getElementById('idhidden' + id_parametro+id_evento).value = "0";
        },
        error: function (data) {
            alert('error');
        }
    });
}

function MaximoPorcentajeEntr(Entregables,id_evento) {
    var sumaporcentaje = 0;
    Entregables.forEach(function (valor, indice, array) {
        sumaporcentaje = sumaporcentaje + parseInt(document.getElementById("textporcentaje" + valor+id_evento).value);
    });
    return sumaporcentaje;
}

function CrearEntregable(){
     $.ajax({
        type: "GET",
        url: '/Acero/RegistroParametro?Des_valor_parametro='+document.getElementById("entregableNuevo").value+'&Desc_tipo_parametro=Entregable&Tipo_parametro=ENTR&Valor_parametro=PANU',
        success: function (data) {
            if (data == '1') {
                window.location.reload(); 
            } else if (data == "3" || data=="2") {
                document.getElementById('alerIncorrectEntr'+id_evento).style.display = 'none';
                document.getElementById('alertCorrectEntr'+id_evento).style.display = 'block';
                document.getElementById('menerror'+id_evento).innerHTML = "";
                document.getElementById('menerror'+id_evento).innerHTML = "No se creo correctamente el entregable";
            }
        },
        error: function (data) {
            alert('error');
        }
    });
}

function CerrarEvento(id_evento){
    if(confirm("Desea cerrar el evento de forma permanente?")){
       $.ajax({
        type: "GET",
        url: '/Acero/CerrarEvento?id_evento='+id_evento,
        success: function (data) {
            if (data == 'true') {
                    alert("El evento se cerro correctamente");
                    window.location.reload(); 
                    
            }else{
                alert("El event no se cerro correctamente");
            }
        },
        error: function (data) {
            alert('error');
        }
    });
    }
}

function BloquearActEvento(){
    if(document.getElementById("hiddenEstadoEvento").value=="CERR"){
        document.getElementById("descripcion").disabled=true;
        document.getElementById("year").disabled=true;
        document.getElementById("periodo").disabled=true;
        document.getElementById("tipo_evento").disabled=true;
        document.getElementById("estado_evento").disabled=true;
        document.getElementById("fecha_apertura").disabled=true;
        document.getElementById("fecha_inicio_clases").disabled=true;
        document.getElementById("fecha_fin_clases").disabled=true;
        document.getElementById("fecha_ini_entregables").disabled=true;
        document.getElementById("fecha_fin_entregables").disabled=true;
        document.getElementById("guardarCambios").disabled=true;
    }
}