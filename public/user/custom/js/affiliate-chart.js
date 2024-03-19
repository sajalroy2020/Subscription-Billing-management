(function ($) {
    var options = {
        series: [{
            name: "",
            data: AFFILIATEMONLTHLYVALUE,
        },],
        chart: {
            type: "bar",
            height: 350,
            toolbar: {
                show: false,
            },
        },
        plotOptions: {
            bar: {
                borderRadius: 7,
                horizontal: false,
            },
        },
        dataLabels: {
            enabled: false,
        },
        stroke: {
            show: true,
            width: 2,
        },
        states: {
            hover: {
                filter: {
                    type: "none",
                    value: 0.1,
                },
            },
        },
        xaxis: {
            categories: MONTHS,
            axisTicks: {
                show: false,
            },
        },
        yaxis: {
            tickAmount: 4,
            // min: 0,
            // max: 3000,
            crosshairs: {
                show: true,
                position: "back",
                stroke: {
                    color: "#000000",
                },
            },
        },
        fill: {
            opacity: 1,
        },
        colors: ["#7F56D9", "#ff0000"],
        legend: {
            show: false,
        },
    };

    var zAffiliateCommissionHistoryChart = new ApexCharts(document.querySelector("#affiliateCommissionHistoryChart"), options); zAffiliateCommissionHistoryChart.render();
})(jQuery);
