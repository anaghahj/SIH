import 'package:objectbox/objectbox.dart';

@Entity()
class Users{
  Users(this.username,this.password);

  @Id()
  int id=0;
  String username;
  String password;


}