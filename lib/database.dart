import 'Person.dart';
Person a  = new Person('Pradeep', '9360212098', '123');
late List<Person> user =[a];
late Person currentUser;
List<List<bool>> carSlots =[[false,false,false,false,false,false],[true,false,false,false,false,false],[true,false,false,false,false,false],[false,false,false,false,false,false]];
void addPerson(Person a)
{
  user.add(a);
}
void freeSlot(String s)
{
  carSlots[s[0].codeUnitAt(0) - 'A'.codeUnitAt(0)][int.parse(s[1])] = false;
}
bool loginUser(String ph,String pass)
{
  for(var i = 0;i<user.length;i++)
  {
    if(ph == user[i].getPhno() && pass == user[i].getPassword())
    {
      currentUser = user[i];
      return true;
    }
  }
  return false;
}
String getDetails()
{
  return currentUser.getName();
}


