class User {
  int? id;
  String userName;
  String email;
  String password;
  String? location;
   List? friends;
   List? hobbies;

  User({this.id,required this.userName, required this.email, required this.password,
      this.location, this.friends, this.hobbies});
}

class Friend {
  int? id;
  final String name;
  final String imageUrl;

  Friend({ this.id, required this.name, required this.imageUrl});
}

class Hobby {
  int id;
  final String hobby;
  Hobby({required this.id, required this.hobby});
}

List<User> userList = [
  User(
    id: 0,
    userName: 'John',
    email: 'john@example.com',
    password: 'password1',
    friends: [
      Friend(
          id: 1,
          name: 'Grace',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
      Friend(
          id: 2,
          name: 'Henry',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
      Friend(
          id: 3,
          name: 'Isabella',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
      Friend(
          id: 4,
          name: 'Jack',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
      Friend(
          id: 5,
          name: 'Kelly',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
      Friend(
          id: 6,
          name: 'Liam',
          imageUrl: 'https://source.unsplash.com/k9XZPpPHDho'),
    ],
    hobbies: [
      Hobby(id: 1, hobby: 'Reading'),
      Hobby(id: 2, hobby: 'Cooking'),
      Hobby(id: 3, hobby: 'Gaming'),
    ],
  ),
  User(
    id:1,
    userName: 'Jane',
    email: 'jane@example.com',
    password: 'password2',
    friends: [
      Friend(
          id: 1,
          name: 'Grace',
          imageUrl: 'https://source.unsplash.com/mou0S7ViElQ'),
      Friend(
          id: 2,
          name: 'Henry',
          imageUrl: 'https://source.unsplash.com/6-adg66qleM'),
      Friend(
          id: 3,
          name: 'Isabella',
          imageUrl: 'https://source.unsplash.com/t0Bv0OBQuTg'),
      Friend(
          id: 4,
          name: 'Jack',
          imageUrl: 'https://source.unsplash.com/YmTIxQbQo4I'),
      Friend(
          id: 5,
          name: 'Kelly',
          imageUrl: 'https://source.unsplash.com/NE0XGVKTmcA'),
      Friend(
          id: 6,
          name: 'Liam',
          imageUrl: 'https://source.unsplash.com/brFsZ7qszSY'),
          
    ],
    hobbies: [
      Hobby(id: 1, hobby: 'Traveling'),
      Hobby(id: 2, hobby: 'Photography'),
      Hobby(id: 3, hobby: 'Hiking'),
    ],
  ),
  // Add more User objects as needed
];
