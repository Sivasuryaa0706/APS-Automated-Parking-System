import 'Car.dart';
import 'dart:collection';

class Person
{
  late String name;
  late String phno;
  late String email;
  late String password;
  late List<Car> cars = [];
  late List<Car> activeCars = [];
  late List<Car> history = [];

  Person(String n,String ph, String pass)
  {
    name = n;
    phno = ph;
    password = pass;
  }
  void setIsactiveTrue(String carno,bool val)
  {
    for(Car c in cars)
    {
      if(c.getcarNo() == carno)
      {
        c.setIsActive(val);
        return;
      }
    }
  }
  List<String> listCars()
  {
    List<String> carslist = [];
    for(Car c in cars)
      {
        if(c.getIsActive() == false)
          {
            carslist.add(c.getcarNo().toString());
          }
      }
    return carslist;
  }
  void deActiveCar(Car newcar)
  {
    activeCars.remove(newcar);
    newcar.setIsActive(false);
    history.add(newcar);
  }
  void addHistory(Car newcar)
  {
    history.add(newcar);
  }
  int getCarIndex(String carname)
  {
    int i = 0;
    for(Car c in cars)
      {
        if(carname == c.getcarNo())
          {
            return i;
          }
        i++;
      }
    return -1;
  }
  Car getCarAtIndex(int index)
  {
    return cars[index];
  }
  Car getActiveCarAtIndex(int index)
  {
    return activeCars[index];
  }
  Car getHistoryCarAtIndex(int index)
  {
    return history[index];
  }
  void addActiveCar(Car newcar)
  {
    activeCars.add(newcar);
  }
  void addcar(Car newcar)
  {
    cars.add(newcar);
  }
  String getName()
  {
    return name;
  }
  String getPhno()
  {
    return phno;
  }
  String getPassword()
  {
    return password;
  }
  int getCars()
  {
    return cars.length;
  }
  int getActiveCars()
  {
    return activeCars.length;
  }
  int getHistoryCars()
  {
    return history.length;
  }
}