function ActualizarInfoEntregable(id_entregable) {
    console.log(document.getElementById("txtRetAlim"+id_entregable).value);
    var nota=parseFloat(document.getElementById("cboxCalificacion"+id_entregable).value);
    if(nota<0 || nota>5){
        alert("La nota tiene que estar en un rango de 0 a 5");
    }else{
    
    $.ajax({
        type: "GET",
        url: '/Acero/ActualizarInfoEntregable?retroalimentacion=' + document.getElementById("txtRetAlim"+id_entregable).value + '&id_entregable=' + id_entregable + '&nota=' + document.getElementById("cboxCalificacion"+id_entregable).value,
        success: function (data) {
            console.log(data);
            if (data == "true") {
                alert("Se actualizo correctamente la infomracion del entregable");
                location.reload();
            } else {
                alert("No se actualizo correctamente la infomracion del entregable");
            }

        },
        error: function (data) {
            alert('error');
        }
    });
}
}