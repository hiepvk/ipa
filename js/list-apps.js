function setupAppsWithCategory(category) {
    var httpReq = new XMLHttpRequest();
    httpReq.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) JSON.parse(this.responseText).forEach(element => {
            if (category != "featured" && element["category"] != category) return;
            if (category == "featured" && !element["featured"]) return;

            let coldiv = document.createElement("div");
			coldiv.classList = "col-lg-6 col-12";
			
            let card = document.createElement("div");
            card.classList = "card";
            coldiv.appendChild(card);

            let body = document.createElement("div");
            body.classList = "card-body";
            card.appendChild(body);
			
			let align = document.createElement("div");
            align.classList = "align-items-center g-3 row";
            body.appendChild(align);
			
			let colauto = document.createElement("div");
            colauto.classList = "col-auto";
			align.appendChild(colauto);
            
            let img = document.createElement("img");
			img.style = "max-width:48px";
			img.src = element["icon"];
			img.classList = "rounded-circle";
			colauto.appendChild(img);

            let col = document.createElement("div");
            col.classList = "col";
            let cardname = document.createElement("h5");
            cardname.classList = "card-title";
            cardname.innerHTML = element["name"];
			col.appendChild(cardname);
            let carddev = document.createElement("p");
            carddev.classList = "card-text";
            carddev.innerHTML = element["dev"];
			col.appendChild(carddev);
			let shortd = document.createElement("h6");
            shortd.classList = "card-text";
            shortd.innerHTML = element["short-description"];
			col.appendChild(shortd);
			align.appendChild(col);
			
            let div4 = document.createElement("div");
            div4.classList = "col-auto";
			align.appendChild(div4);
			let a = document.createElement("a");
			a.classList = "stretched-link";
			a.href = element["link"];
			div4.appendChild(a);
			
            let div5 = document.createElement("p");
            div5.classList = "card-text";
            div5.innerHTML = element["version"];
			div4.appendChild(div5);
			align.appendChild(div4);

            let listContainer = "";
            if (category == "cate1") listContainer = "Cate1AppsList";
            else if (category == "cate2") listContainer = "Cate2AppsList";
			else if (category == "cate3") listContainer = "Cate3AppsList";
            else listContainer = "popularAppsList";
            document.getElementById(listContainer).appendChild(coldiv);
        });
    };
    httpReq.open("GET", "https://raw.githubusercontent.com/hiepvk/ipa/main/js/list-apps.json", true);
    httpReq.send();
}
