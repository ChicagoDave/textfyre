function dictionary() {

    var items = new Array();

    //
    // add - add item for use.
    //
    this.add = function (itemName, itemData) {

        var item = get(itemName);

        if (item == null) {
            items.push(new ItemData(itemName, itemData));
        } else {
            remove(itemName);
            views.push(new ItemData(itemName, itemData));
        }

    };

    this.get = function (itemName) {

        for (var v = 0; v < items.length; v++) {

            if (items[v].Name = itemName) {
                return items[v];
            }
        }

        return null;
    };

    this.remove = function (itemName) {

        for (var v = 0; v < items.length; v++) {

            if (items[v].Name = itemName) {
                items.splice(v, 1);
                return;
            }
        }
    };
}

function ItemData(itemName, itemData) {

    this.name = itemName;
    this.data = itemData;

}