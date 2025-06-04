import 'package:ish_topdim/data/models/place_model.dart';
import 'package:ish_topdim/data/models/user_model.dart';
import 'category_model.dart';

class Post {
  final String jobAbout;
  final String jobTitle;
  final Category jobCategory;
  final String jobPhoto;
  final String jobContactName;
  final String jobContactNumber;
  final Place jobPlace;
  final User user;

  Post({
    required this.jobAbout,
    required this.jobTitle,
    required this.jobCategory,
    required this.jobPhoto,
    required this.jobContactName,
    required this.jobContactNumber,
    required this.jobPlace,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      jobAbout: json['job_about'],
      jobTitle: json['job_title'],
      jobCategory: Category.fromJson(json['job_category']),
      jobPhoto: json['job_photo'],
      jobContactName: json['job_contact_name'],
      jobContactNumber: json['job_contact_number'],
      jobPlace: Place.fromJson(json['job_place']),
      user: User.fromJson(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_about': jobAbout,
      'job_title': jobTitle,
      'job_category': jobCategory.toJson(),
      'job_photo': jobPhoto,
      'job_contact_name': jobContactName,
      'job_contact_number': jobContactNumber,
      'job_place': jobPlace.toJson(),
      'user_id': user.toJson(),
    };
  }
}
