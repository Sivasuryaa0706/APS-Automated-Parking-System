class Car
{
  late String carName;
  late String carNo;
  late String wheeler;
  late String owned;
  late String slot;
  bool isActive = false;
  late DateTime date;
  late double amount;
  Car(String n,String no,String w,String own)
  {
    carName = n;
    carNo = no;
    wheeler = w;
    owned = own;
  }
  double getAmount()
  {
    return amount;
  }
  void setAmount(double a)
  {
    amount = a;
  }

  void setSlot(String s)
  {
    slot = s;
  }
  String getCarName()
  {
    return carName;
  }
  String getcarNo()
  {
    return carNo;
  }
  String getWheeler()
  {
    return wheeler;
  }
  String getOwned()
  {
    return owned;
  }
  bool getIsActive()
  {
    return isActive;
  }
  void setIsActive(bool stat)
  {
    isActive = stat;
    if(stat == true)
      {
        date = DateTime.now();
      }
  }
  String subtitle()
  {
    String s = carName + "\n" + date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString() + "\n" + date.hour.toString() + ":" + date.minute.toString() + " IST";
    return s;
  }
  String getSlot()
  {
    return slot;
  }


}