// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

async function buildChart() {
    let endpoint = "https://curadoria.yabaconsultoria.com.br/endpoint/campanhas/${campanha.id}/categorias/${categoria.id}/resultado/votos";
    let response = await fetch(endpoint, {
        method: 'GET',
        headers: {
            "Content-Type": "text/plain"
        }
    })
        .then(res => res.json())
    let data = await response;

    // Bar Chart Example
    var ctx = document.getElementById("usuario-votos");
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["1 Voto", "2 Votos", "3 Votos"],
            datasets: [{
                label: "Usuários",
                backgroundColor: "#2ecc71",
                hoverBackgroundColor: "#27ae60",
                borderColor: "#2ecc71",
                data: await data,
            }],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            legend: {
                display: false
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
        }
    });
}

buildChart();