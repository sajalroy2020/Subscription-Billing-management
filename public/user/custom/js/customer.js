(function ($) {
    "use strict";

    $("#customersTable").DataTable({
        pageLength: 10,
        ordering: false,
        serverSide: true,
        processing: true,
        searching: false,
        responsive: {
            breakpoints: [
                { name: "desktop", width: Infinity },
                { name: "tablet", width: 1400 },
                { name: "fablet", width: 768 },
                { name: "phone", width: 480 },
            ],
        },
        ajax: $('#customer-list').val(),
        language: {
            paginate: {
                previous: "<i class='fa-solid fa-angles-left'></i>",
                next: "<i class='fa-solid fa-angles-right'></i>",
            },
            searchPlaceholder: "Search pending event",
            search: "<span class='searchIcon'><i class='fa-solid fa-magnifying-glass'></i></span>",
        },
        dom: '<>tr<"tableBottom"<"row align-items-center"<"col-sm-6"<"tableInfo"i>><"col-sm-6"<"tablePagi"p>>>><"clear">',
        columns: [
            {"data": "name", "name": "name",responsivePriority:1},
            {"data": "email", "name": "email"},
            {"data": "created_at", "name": "userDetail.created_at"},
            {"data": "country", "name": "userDetail.country"},
            {"data": "payment", "name": "userDetail.payment"},
            {"data": "revenue", "name": "userDetail.revenue"},
            {"data": "action", "name": "action"},
        ],
    });

})(jQuery)
