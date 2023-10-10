// Here contains all the generic information about the person.

class Person {
  String _name = "";
  int _age;
  double _weight;
  double _height;

  Person(this._name, this._age, this._weight, this._height);

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setAge(int age) {
    _age = age;
  }

  int getAge() {
    return _age;
  }

  void setWeigth(double weight) {
    _weight = weight;
  }

  double getWeight() {
    return _weight;
  }

  void setHeight(double height) {
    _height = height;
  }

  double getHeight() {
    return _height;
  }

  double calculateBMI() {
    var bmi = _weight / (_height * _height);
    return bmi;
  }
}
