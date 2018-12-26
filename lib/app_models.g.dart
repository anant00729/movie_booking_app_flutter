// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
      Message: json['Message'] as String,
      Status: json['Status'] as bool,
      movieList: (json['shows'] as List)
          ?.map((e) => e == null
              ? null
              : HomeDataList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'Message': instance.Message,
      'Status': instance.Status,
      'shows': instance.movieList
    };

HomeDataList _$HomeDataListFromJson(Map<String, dynamic> json) {
  return HomeDataList(
      CategoryID: json['CategoryID'] as int,
      Title: json['Title'] as String,
      SubTitle: json['SubTitle'] as String,
      movies: (json['Movies'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeDataListToJson(HomeDataList instance) =>
    <String, dynamic>{
      'CategoryID': instance.CategoryID,
      'Title': instance.Title,
      'SubTitle': instance.SubTitle,
      'Movies': instance.movies
    };

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      ID: json['ID'] as int,
      Name: json['Name'] as String,
      Image: json['Image'] as String,
      Rated: json['Rated'] as String,
      Year: json['Year'] as String,
      Time: json['Time'] as String,
      CinemaScheduleID: json['CinemaScheduleID'] as int,
      ScheduleCount: json['ScheduleCount'] as int);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'ID': instance.ID,
      'Name': instance.Name,
      'Image': instance.Image,
      'Rated': instance.Rated,
      'Year': instance.Year,
      'Time': instance.Time,
      'CinemaScheduleID': instance.CinemaScheduleID,
      'ScheduleCount': instance.ScheduleCount
    };

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) {
  return MovieDetails(
      ID: json['ID'] as int,
      HeaderImage: json['HeaderImage'] as String,
      BannerImage: json['BannerImage'] as String,
      Name: json['Name'] as String,
      Lang: json['Lang'] as String,
      Time: json['Time'] as String,
      Year: json['Year'] as String,
      StoryLine: json['StoryLine'] as String,
      Runtime: json['Runtime'] as String,
      IMDBRating: json['IMDBRating'] as String,
      Rated: json['Rated'] as String,
      trailers: (json['Trailers'] as List)
          ?.map((e) =>
              e == null ? null : Trailers.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      directors: (json['Directors'] as List)
          ?.map((e) =>
              e == null ? null : Directors.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      actors: (json['Actors'] as List)
          ?.map((e) =>
              e == null ? null : Actors.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'HeaderImage': instance.HeaderImage,
      'BannerImage': instance.BannerImage,
      'Name': instance.Name,
      'Lang': instance.Lang,
      'Time': instance.Time,
      'Year': instance.Year,
      'StoryLine': instance.StoryLine,
      'Runtime': instance.Runtime,
      'IMDBRating': instance.IMDBRating,
      'Rated': instance.Rated,
      'Trailers': instance.trailers,
      'Directors': instance.directors,
      'Actors': instance.actors
    };

Trailers _$TrailersFromJson(Map<String, dynamic> json) {
  return Trailers(
      LinkID: json['LinkID'] as int,
      URI: json['URI'] as String,
      MediaType: json['MediaType'] as String,
      Media: json['Media'] as String,
      MediaThumb: json['MediaThumb'] as String);
}

Map<String, dynamic> _$TrailersToJson(Trailers instance) => <String, dynamic>{
      'LinkID': instance.LinkID,
      'URI': instance.URI,
      'MediaType': instance.MediaType,
      'MediaThumb': instance.MediaThumb,
      'Media': instance.Media
    };

Directors _$DirectorsFromJson(Map<String, dynamic> json) {
  return Directors(
      ID: json['ID'] as int,
      Image: json['Image'] as String,
      Name: json['Name'] as String);
}

Map<String, dynamic> _$DirectorsToJson(Directors instance) => <String, dynamic>{
      'ID': instance.ID,
      'Image': instance.Image,
      'Name': instance.Name
    };

Actors _$ActorsFromJson(Map<String, dynamic> json) {
  return Actors(
      ID: json['ID'] as int,
      Image: json['Image'] as String,
      Name: json['Name'] as String);
}

Map<String, dynamic> _$ActorsToJson(Actors instance) => <String, dynamic>{
      'ID': instance.ID,
      'Image': instance.Image,
      'Name': instance.Name
    };

CinemaList _$CinemaListFromJson(Map<String, dynamic> json) {
  return CinemaList(
      Status: json['Status'] as String,
      Message: json['Message'] as String,
      cinema: json['Cinema'] == null
          ? null
          : Cinema.fromJson(json['Cinema'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CinemaListToJson(CinemaList instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Message': instance.Message,
      'Cinema': instance.cinema
    };

Cinema _$CinemaFromJson(Map<String, dynamic> json) {
  return Cinema(
      CinemaID: json['CinemaID'] as int,
      CinemaName: json['CinemaName'] as String,
      Address: json['Address'] as String,
      ScreenCount: json['ScreenCount'] as int,
      CinemaScheduleID: json['CinemaScheduleID'] as int,
      OrganizationName: json['OrganizationName'] as String);
}

Map<String, dynamic> _$CinemaToJson(Cinema instance) => <String, dynamic>{
      'CinemaID': instance.CinemaID,
      'CinemaName': instance.CinemaName,
      'Address': instance.Address,
      'ScreenCount': instance.ScreenCount,
      'CinemaScheduleID': instance.CinemaScheduleID,
      'OrganizationName': instance.OrganizationName
    };
