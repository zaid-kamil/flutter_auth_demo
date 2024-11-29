class AppUser {
  final String id;
  final String email;
  final String name;
  final String photoUrl;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

 // convert to json
    Map<String, dynamic> toJson() {
        return {
        'id': id,
        'email': email,
        'name': name,
        'photoUrl': photoUrl,
        };
    }
    
    // convert from json
    factory AppUser.fromJson(Map<String, dynamic> json) {
        return AppUser(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        photoUrl: json['photoUrl'],
        );
    }
    
}