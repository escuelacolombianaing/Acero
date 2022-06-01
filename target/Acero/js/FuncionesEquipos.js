function AsignarTutor(id_equipo, id_reto, id_nacional_tutor) {
    $.ajax({
        type: "GET",
        url: '/Acero/AsignarTutor?id_equipo=' + id_equipo + '&id_reto=' + id_reto + '&id_nacional_tutor=' + id_nacional_tutor,
        success: function (data) {
            if (data == 'true') {
                document.getElementById('alertCorrect').style.display = 'block';
                document.getElementById('alerIncorrect').style.display = 'none';
            } else {
                document.getElementById('alerIncorrect').style.display = 'block';
                document.getElementById('alertCorrect').style.display = 'none';
            }
        },
        error: function (data) {
            alert('error');
        }
    });
}

function CargarArchivos(id_reto,id_equipo,id_archivo){
    
}
        