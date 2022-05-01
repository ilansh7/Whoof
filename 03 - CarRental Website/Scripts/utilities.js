/*!
 * utilities.js
 *
 * Copyright (c) Ilan Shchori
 * 
 */

function searchFilter(term, _id, columns) {
    //debugger;
    //try {
    var suche = term.toLowerCase();
    var table = document.getElementById(_id);
    //var titles = document.getElementsByTagName("th");
    var ele;
    //var title;
    for (var i = 1; i < table.rows.length; i++) {
        //ele = table.rows[i].cells[0].innerHTML.replace(/<[^>]+>/g, "");
        ele = table.rows[i].cells[0].innerText;
        //title = table.rows[i].title;
        //if (titles[i].innerHTML == "Action") { alert(this.innerHTML); }
        for (var j = 1; j < columns; j++) {
            //ele += table.rows[i].cells[j].innerHTML.replace(/<[^>]+>/g, "");
            ele += table.rows[i].cells[j].innerText;
        }

        if (ele.toLowerCase().indexOf(suche) >= 0) {
            table.rows[i].style.display = '';
        }
        else {
            table.rows[i].style.display = 'none';
        }
    }
    //}
    //catch (err) {
    //}
}