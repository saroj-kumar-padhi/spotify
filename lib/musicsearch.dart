void searchArray(String key,) {
    bool isFound = false;
    var arr=['295','No Love','Lovely','Tu kafi hai','Rihaayi','Lele ram ram','Samjhawan','Piya aaye na','Ajj kal ve','Desires','Brown munde','Arcade','Unstoppable','intentions'];
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == key) {
        print("The Item is found $key and The index is $i");
        isFound = true;
        return;
      }
    }
    if (isFound==false) {
      print('Not found');
      return;
    } 
  }