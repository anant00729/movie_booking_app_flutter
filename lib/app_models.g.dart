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
      Status: json['Status'] as bool,
      Message: json['Message'] as String,
      cinema: (json['Cinema'] as List)
          ?.map((e) =>
              e == null ? null : Cinema.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CinemaListToJson(CinemaList instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Message': instance.Message,
      'Cinema': instance.cinema
    };

Cinema _$CinemaFromJson(Map<String, dynamic> json) {
  return Cinema(
      CinemaID: json['CinemaID'] as String,
      CinemaName: json['CinemaName'] as String,
      Address: json['Address'] as String,
      ScreenCount: json['ScreenCount'] as int,
      OrganizationName: json['OrganizationName'] as String,
      CinemaScheduleID: json['CinemaScheduleID'] as int,
      SchTDate: json['SchTDate'] as String,
      Format: json['Format'] as String,
      CinemaTimings: json['CinemaTimings'] as String);
}

Map<String, dynamic> _$CinemaToJson(Cinema instance) => <String, dynamic>{
      'CinemaID': instance.CinemaID,
      'CinemaName': instance.CinemaName,
      'Address': instance.Address,
      'ScreenCount': instance.ScreenCount,
      'OrganizationName': instance.OrganizationName,
      'SchTDate': instance.SchTDate,
      'Format': instance.Format,
      'CinemaTimings': instance.CinemaTimings,
      'CinemaScheduleID': instance.CinemaScheduleID
    };

GetSeatLayout _$GetSeatLayoutFromJson(Map<String, dynamic> json) {
  return GetSeatLayout(
      Status: json['Status'] as bool,
      Message: json['Message'] as String,
      Row: json['Row'] as String,
      Column: json['Column'] as String,
      CinemaName: json['CinemaName'] as String,
      Address: json['Address'] as String,
      Currency: json['Currency'] as String,
      ScreenName: json['ScreenName'] as String,
      ConFee: json['ConFee'] as int,
      seatLayouts: (json['SeatLayouts'] as List)
          ?.map((e) => e == null
              ? null
              : SeatLayouts.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      seatTypes: (json['SeatTypes'] as List)
          ?.map((e) =>
              e == null ? null : SeatTypes.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GetSeatLayoutToJson(GetSeatLayout instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Message': instance.Message,
      'Row': instance.Row,
      'Column': instance.Column,
      'CinemaName': instance.CinemaName,
      'Address': instance.Address,
      'Currency': instance.Currency,
      'ScreenName': instance.ScreenName,
      'ConFee': instance.ConFee,
      'SeatLayouts': instance.seatLayouts,
      'SeatTypes': instance.seatTypes
    };

SeatLayouts _$SeatLayoutsFromJson(Map<String, dynamic> json) {
  return SeatLayouts(
      seats: (json['Seats'] as List)
          ?.map((e) =>
              e == null ? null : Seats.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SeatLayoutsToJson(SeatLayouts instance) =>
    <String, dynamic>{
      'Seats': instance.seats,
      'col_no': instance.col_no,
      'row_no': instance.row_no
    };

SeatTypes _$SeatTypesFromJson(Map<String, dynamic> json) {
  return SeatTypes(
      SeatClassPriceID: json['SeatClassPriceID'] as String,
      SeatClassID: json['SeatClassID'] as int,
      Price: (json['Price'] as num)?.toDouble(),
      Type: json['Type'] as String,
      Label: json['Label'] as String);
}

Map<String, dynamic> _$SeatTypesToJson(SeatTypes instance) => <String, dynamic>{
      'SeatClassPriceID': instance.SeatClassPriceID,
      'SeatClassID': instance.SeatClassID,
      'Price': instance.Price,
      'Type': instance.Type,
      'Label': instance.Label
    };

Seats _$SeatsFromJson(Map<String, dynamic> json) {
  return Seats(
      Column: json['Column'] as String,
      SeatName: json['SeatName'] as String,
      Status: json['Status'] as int,
      SeatlayoutID: json['SeatlayoutID'] as String,
      SeatClassID: json['SeatClassID'] as String,
      Price: (json['Price'] as num)?.toDouble());
      //..row_number = json['row_number'] as int;
}

Map<String, dynamic> _$SeatsToJson(Seats instance) => <String, dynamic>{
      'Column': instance.Column,
      'SeatName': instance.SeatName,
      'Status': instance.Status,
      'SeatlayoutID': instance.SeatlayoutID,
      'SeatClassID': instance.SeatClassID,
      'Price': instance.Price,
      'row_number': instance.row_number
    };
