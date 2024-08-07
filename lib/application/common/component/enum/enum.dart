enum RouteType { push, pushReplace, pushRemove }

enum CategoryMoneyExpense {
  food('Food'),
  education('Education'),
  entertainment('Entertainment'),
  gift('Gift'),
  homeTools('HomeTools'),
  internet('Internet'),
  shopping('Shopping'),
  sport('Sport'),
  transport('Transport');

  final String value;

  const CategoryMoneyExpense(this.value);
}

enum CategoryMoneyExpenseId {
  food('Makanan'),
  education('Pendidikan'),
  entertainment('Hiburan'),
  gift('Hadiah'),
  homeTools('Alat Rumah'),
  internet('Internet'),
  shopping('Belanja'),
  sport('Olahraga'),
  transport('Transport');

  final String value;

  const CategoryMoneyExpenseId(this.value);
}
